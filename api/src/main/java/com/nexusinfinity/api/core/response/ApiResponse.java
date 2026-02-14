package com.nexusinfinity.api.core.response;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record ApiResponse<T>(
        boolean success,
        String message,
        @JsonInclude(JsonInclude.Include.ALWAYS)
        T data,
        String timestamp,
        Integer status,
        String path
        ) {

    public static <T> ApiResponse<T> ok(T data) {
        return new ApiResponse<>(true, null, data, null, null, null);
    }

    public static <T> ApiResponse<T> ok(T data, String message) {
        return new ApiResponse<>(true, message, data, null, null, null);
    }

    public static <T> ApiResponse<T> fail(String message) {
        return new ApiResponse<>(false, message, null, null, null, null);
    }
}
