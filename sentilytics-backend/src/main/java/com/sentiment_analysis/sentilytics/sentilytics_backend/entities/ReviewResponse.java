package com.sentiment_analysis.sentilytics.sentilytics_backend.entities;

import lombok.Data;

@Data
public class ReviewResponse {
    private String status;
    private String request_id;
    private Parameters parameters;
    private ReviewData data;
}
