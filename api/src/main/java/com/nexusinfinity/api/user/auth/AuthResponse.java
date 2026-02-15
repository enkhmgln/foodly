package com.nexusinfinity.api.user.auth;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.nexusinfinity.api.user.UserResponse;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record AuthResponse(String token, UserResponse user) {

}
