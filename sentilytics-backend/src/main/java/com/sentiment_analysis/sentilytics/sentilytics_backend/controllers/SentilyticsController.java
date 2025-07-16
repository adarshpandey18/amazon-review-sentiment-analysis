package com.sentiment_analysis.sentilytics.sentilytics_backend.controllers;

import com.sentiment_analysis.sentilytics.sentilytics_backend.dto.AnalysisDTO;
import com.sentiment_analysis.sentilytics.sentilytics_backend.entities.ReviewResponse;
import com.sentiment_analysis.sentilytics.sentilytics_backend.services.SentilyticsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/sentilytics")
public class SentilyticsController {

    private final SentilyticsService sentilyticsService;

    public SentilyticsController(SentilyticsService sentilyticsService) {
        this.sentilyticsService = sentilyticsService;
    }

    @GetMapping("/{asin}")
    public ResponseEntity<AnalysisDTO> getAnalysis(@PathVariable String asin) {
        AnalysisDTO result = sentilyticsService.performSentimentAnalysis(asin);
        return ResponseEntity.ok(result);
    }


}
