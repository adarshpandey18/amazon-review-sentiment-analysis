package com.sentiment_analysis.sentilytics.sentilytics_backend.dto;

import lombok.Data;

@Data
public class AnalysisDTO {
    private String sentimentLabel;
    private float averageScore;
    private String summary;
}
