package com.nexusinfinity.api.module.user.auth;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.nexusinfinity.api.module.user.UserResponse;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record AuthResponse(String token, UserResponse user) {

}
