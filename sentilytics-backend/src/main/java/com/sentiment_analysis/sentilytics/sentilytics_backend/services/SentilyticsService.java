package com.sentiment_analysis.sentilytics.sentilytics_backend.services;

import com.sentiment_analysis.sentilytics.sentilytics_backend.dto.AnalysisDTO;
import com.sentiment_analysis.sentilytics.sentilytics_backend.entities.Review;
import com.sentiment_analysis.sentilytics.sentilytics_backend.entities.ReviewResponse;
import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;
import edu.stanford.nlp.sentiment.SentimentCoreAnnotations;
import edu.stanford.nlp.util.CoreMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Properties;

@Service
public class SentilyticsService {
    @Value("${reviews.url.link}")
    String url;
    @Value("${reviews.url.key}")
    String key;

    private final StanfordCoreNLP pipeline;
    private final RestTemplate restTemplate;

    public SentilyticsService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
        Properties props = new Properties();
        props.setProperty("annotators", "tokenize,ssplit,parse,sentiment");
        this.pipeline = new StanfordCoreNLP(props);

    }

    public AnalysisDTO performSentimentAnalysis(String asin) {
        ReviewResponse response = getReviews(asin);
        List<Review> reviewList = response.getData().getReviews();
        List<String> reviewComments = reviewList.stream().map(Review::getReview_comment).toList();
        String sentiments = analyzeSentiments(reviewComments);
        int score = mapSentimentToScore(sentiments);
        AnalysisDTO analysisDTO = new AnalysisDTO();
        analysisDTO.setSentimentLabel(sentiments);
        analysisDTO.setAverageScore(score);
        String summary = generateSummary(sentiments, score, reviewList.size());
        analysisDTO.setSummary(summary);

        return analysisDTO;
    }

    public ReviewResponse getReviews(String asin) {
        String finalUrl = String.format(url,asin);

        HttpHeaders headers = new HttpHeaders();
        headers.set("x-rapidapi-key", key);
        headers.set("x-rapidapi-host", "real-time-amazon-data.p.rapidapi.com");

        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        ResponseEntity<ReviewResponse> response = restTemplate.exchange(
                finalUrl,
                HttpMethod.GET,
                requestEntity,
                ReviewResponse.class
        );

        return response.getBody();
    }


    public String analyzeSentiments(List<String> texts) {
        int totalScore = 0;
        int count = 0;

        for (String text : texts) {
            Annotation annotation = new Annotation(text);
            pipeline.annotate(annotation);

            List<CoreMap> sentences = annotation.get(CoreAnnotations.SentencesAnnotation.class);
            for (CoreMap sentence : sentences) {
                String sentiment = sentence.get(SentimentCoreAnnotations.SentimentClass.class);
                int score = mapSentimentToScore(sentiment);
                totalScore += score;
                count++;
            }
        }

        int avgScore = count == 0 ? 2 : totalScore / count;
        return overallSentiment(avgScore);
    }

    private int mapSentimentToScore(String sentiment) {
        switch (sentiment.toLowerCase()) {
            case "very negative":
                return 0;
            case "negative":
                return 1;
            case "neutral":
                return 2;
            case "positive":
                return 3;
            case "very positive":
                return 4;
            default:
                return 2;
        }
    }

    private String overallSentiment(int score) {
        if (score <= 1) return "Negative";
        else if (score == 2) return "Neutral";
        else return "Positive";
    }
    private String generateSummary(String sentiment, int score, int totalReviews) {
        return String.format(
                "Out of %d analyzed reviews, the overall sentiment is %s with an average sentiment score of %.1f on a 0–4 scale.",
                totalReviews,
                sentiment,
                (float) score
        );
    }

}
