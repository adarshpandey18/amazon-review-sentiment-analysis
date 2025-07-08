package com.sentiment_analysis.sentilytics.sentilytics_backend.services;

import com.sentiment_analysis.sentilytics.sentilytics_backend.entities.ReviewResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class SentilyticsService {
    @Value("${reviews.url.link}")
    String url;
    @Value("${reviews.url.key}")
    String key;

    private final RestTemplate restTemplate;

    public SentilyticsService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public void performSentimentAnalysis(String asin) {

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
}
