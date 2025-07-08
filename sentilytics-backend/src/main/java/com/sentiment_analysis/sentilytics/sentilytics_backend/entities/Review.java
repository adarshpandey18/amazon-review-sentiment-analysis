package com.sentiment_analysis.sentilytics.sentilytics_backend.entities;

import lombok.Data;

import java.util.List;

@Data
public class Review {
    private String review_id;
    private String review_title;
    private String review_comment;
    private String review_star_rating;
    private String review_link;
    private String review_author_id;
    private String review_author;
    private String review_author_url;
    private String review_author_avatar;
    private List<String> review_images;
    private String review_video;
    private String review_date;
    private boolean is_verified_purchase;
    private String helpful_vote_statement;
    private String reviewed_product_asin;
    private boolean is_vine;
}

