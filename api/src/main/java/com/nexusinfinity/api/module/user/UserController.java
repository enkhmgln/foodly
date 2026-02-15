package com.nexusinfinity.api.module.user;

import static org.springframework.http.HttpStatus.OK;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nexusinfinity.api.core.response.ApiResponse;
import com.nexusinfinity.api.module.user.auth.AuthService;

@RestController
@RequestMapping("/users")
public class UserController {

    private final AuthService authService;

    public UserController(AuthService authService) {
        this.authService = authService;
    }

    @GetMapping("/me")
    public ResponseEntity<ApiResponse<UserResponse>> me() {
        String principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        UserResponse data = authService.getCurrentUser(principal);
        return ResponseEntity.status(OK).body(ApiResponse.ok(data));
    }
}
