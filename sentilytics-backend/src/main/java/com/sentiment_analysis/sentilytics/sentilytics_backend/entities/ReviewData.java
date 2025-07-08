package com.sentiment_analysis.sentilytics.sentilytics_backend.entities;

import lombok.Data;

import java.util.List;

@Data
public class ReviewData {
    private String asin;
    private Integer total_reviews;
    private Object total_ratings;
    private String country;
    private String domain;
    private List<Review> reviews;
}

