package com.nexusinfinity.api.user.auth;

import jakarta.validation.constraints.NotBlank;

public record LoginRequest(
        @NotBlank(message = "Имэйл оруулна уу")
        String email,
        @NotBlank(message = "Нууц үг оруулна уу")
        String password,
        String fcmToken
        ) {

}
