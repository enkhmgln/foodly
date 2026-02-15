package com.nexusinfinity.api.module.user.auth;

import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.nexusinfinity.api.core.response.ApiMessages;
import com.nexusinfinity.api.core.security.JwtService;
import com.nexusinfinity.api.module.notification.FcmService;
import com.nexusinfinity.api.module.notification.Notification;
import com.nexusinfinity.api.module.notification.NotificationRepository;
import com.nexusinfinity.api.module.user.User;
import com.nexusinfinity.api.module.user.UserRepository;
import com.nexusinfinity.api.module.user.UserResponse;

@Service
public class AuthService {

    private final UserRepository userRepository;
    private final FcmService fcmService;
    private final NotificationRepository notificationRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthService(UserRepository userRepository, FcmService fcmService,
            NotificationRepository notificationRepository, PasswordEncoder passwordEncoder, JwtService jwtService) {
        this.userRepository = userRepository;
        this.fcmService = fcmService;
        this.notificationRepository = notificationRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    public AuthResponse signup(SignupRequest request) {
        String email = request.email().trim().toLowerCase();
        if (userRepository.existsByEmail(email)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, ApiMessages.AUTH_EMAIL_TAKEN);
        }
        String name = request.name() != null && !request.name().isBlank() ? request.name().trim() : null;
        User user = User.builder()
                .email(email)
                .passwordHash(passwordEncoder.encode(request.password()))
                .name(name)
                .build();
        user = userRepository.save(user);
        fcmService.registerToken(user, request.fcmToken());
        fcmService.sendToUser(user.getId(), "Foodly-д тавтай морил!", "Бидэнтэй нэгдсэн танд баярлалаа. Бүтээгдэхүүний эрүүл мэндийн үнэлгээг харахын тулд скан хийж эхлээрэй.", null);
        notificationRepository.save(Notification.builder()
                .user(user)
                .title("Foodly-д тавтай морил!")
                .body("Бидэнтэй нэгдсэн танд баярлалаа. Бүтээгдэхүүний эрүүл мэндийн үнэлгээг харахын тулд скан хийж эхлээрэй.")
                .build());
        String token = jwtService.generateToken(user.getEmail());
        return new AuthResponse(token, UserResponse.fromEntity(user));
    }

    public AuthResponse login(LoginRequest request) {
        String email = request.email().trim().toLowerCase();
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, ApiMessages.AUTH_INVALID_CREDENTIALS));
        if (!passwordEncoder.matches(request.password(), user.getPasswordHash())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, ApiMessages.AUTH_INVALID_CREDENTIALS);
        }
        fcmService.registerToken(user, request.fcmToken());
        String token = jwtService.generateToken(user.getEmail());
        return new AuthResponse(token, UserResponse.fromEntity(user));
    }

    public UserResponse getCurrentUser(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, ApiMessages.AUTH_INVALID_CREDENTIALS));
        return UserResponse.fromEntity(user);
    }
}
