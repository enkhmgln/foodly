package com.nexusinfinity.api.module.user;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record UserResponse(String id, String email, String name) {

    public static UserResponse fromEntity(User user) {
        return new UserResponse(
                user.getId().toString(),
                user.getEmail(),
                user.getName()
        );
    }
}
