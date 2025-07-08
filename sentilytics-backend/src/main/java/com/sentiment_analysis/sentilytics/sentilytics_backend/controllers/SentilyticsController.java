package com.sentiment_analysis.sentilytics.sentilytics_backend.controllers;

import com.sentiment_analysis.sentilytics.sentilytics_backend.entities.ReviewResponse;
import com.sentiment_analysis.sentilytics.sentilytics_backend.services.SentilyticsService;
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
    public ReviewResponse getReviews(@PathVariable String asin) {
       return sentilyticsService.getReviews(asin);
    }

}
