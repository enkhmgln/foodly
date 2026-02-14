package com.nexusinfinity.api.core.response;

import java.time.Instant;

import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@RestControllerAdvice
public class ApiResponseEnricher implements ResponseBodyAdvice<Object> {

    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(
            Object body,
            MethodParameter returnType,
            MediaType selectedContentType,
            Class<? extends HttpMessageConverter<?>> selectedConverterType,
            ServerHttpRequest request,
            ServerHttpResponse response) {
        if (!(body instanceof ApiResponse<?> res)) {
            return body;
        }
        String path = null;
        int status = 200;
        if (request instanceof ServletServerHttpRequest servletRequest) {
            path = servletRequest.getServletRequest().getRequestURI();
        }
        if (response instanceof ServletServerHttpResponse servletResponse) {
            status = servletResponse.getServletResponse().getStatus();
        }
        if (path == null && RequestContextHolder.getRequestAttributes() instanceof ServletRequestAttributes attrs) {
            path = attrs.getRequest().getRequestURI();
            status = attrs.getResponse() != null ? attrs.getResponse().getStatus() : status;
        }
        return new ApiResponse<>(
                res.success(),
                res.message(),
                res.data(),
                Instant.now().toString(),
                status,
                path != null ? path : ""
        );
    }
}
