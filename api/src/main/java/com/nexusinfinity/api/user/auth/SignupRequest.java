package com.nexusinfinity.api.user.auth;

import com.fasterxml.jackson.annotation.JsonInclude;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record SignupRequest(
        @NotBlank(message = "Имэйл оруулна уу")
        @Email(message = "Имэйл буруу байна")
        String email,
        @NotBlank(message = "Нууц үг оруулна уу")
        @Size(min = 8, message = "Нууц үг хамгийн багадаа 8 тэмдэгт байна")
        String password,
        String name,
        String fcmToken
        ) {

}
