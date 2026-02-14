package com.nexusinfinity.api.product;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record ProductResponse(
        String id,
        String name,
        String brand,
        String category,
        String barcode,
        int score,
        String grade,
        String summary,
        List<String> issueTags,
        String imageUrl
        ) {

    public static ProductResponse fromEntity(Product entity) {
        return new ProductResponse(
                entity.getId().toString(),
                entity.getName(),
                entity.getBrand(),
                entity.getCategory(),
                entity.getBarcode(),
                entity.getScore(),
                gradeFromScore(entity.getScore()),
                entity.getSummary(),
                entity.getIssueTags(),
                entity.getImageUrl()
        );
    }

    private static String gradeFromScore(int score) {
        if (score <= 25) {
            return "Bad";
        }
        if (score <= 50) {
            return "Mediocre";
        }
        if (score <= 75) {
            return "Good";
        }
        return "Excellent";
    }
}
