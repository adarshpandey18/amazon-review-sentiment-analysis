package com.sentiment_analysis.sentilytics.sentilytics_backend.entities;

import lombok.Data;

@Data
public class Parameters {
    private String asin;
    private String country;
    private String sort_by;
    private boolean verified_purchases_only;
    private boolean images_or_videos_only;
    private boolean current_format_only;
    private String star_rating;
    private int page;
}

