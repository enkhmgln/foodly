package com.nexusinfinity.api.core.config;

import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import jakarta.annotation.PostConstruct;

@Configuration
public class FirebaseConfig {

    private static final Logger log = LoggerFactory.getLogger(FirebaseConfig.class);

    @Value("${firebase.credentials-path:firebase-service.json}")
    private String credentialsPath;

    @PostConstruct
    public void initialize() {
        Path path = Path.of(credentialsPath);
        if (!Files.isRegularFile(path)) {
            log.info("Firebase credentials file not found at {}; Firebase Admin SDK disabled.", path.toAbsolutePath());
            return;
        }
        if (FirebaseApp.getApps().isEmpty()) {
            try (InputStream stream = new FileInputStream(path.toFile())) {
                FirebaseOptions options = FirebaseOptions.builder()
                        .setCredentials(GoogleCredentials.fromStream(stream))
                        .build();
                FirebaseApp.initializeApp(options);
                log.info("Firebase Admin SDK initialized.");
            } catch (Exception e) {
                log.error("Failed to initialize Firebase Admin SDK", e);
                throw new IllegalStateException("Firebase initialization failed", e);
            }
        }
    }
}
