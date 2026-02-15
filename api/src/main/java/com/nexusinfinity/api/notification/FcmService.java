package com.nexusinfinity.api.notification;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.firebase.FirebaseApp;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.nexusinfinity.api.user.User;

@Service
public class FcmService {

    private static final Logger log = LoggerFactory.getLogger(FcmService.class);

    private final FcmTokenRepository fcmTokenRepository;

    public FcmService(FcmTokenRepository fcmTokenRepository) {
        this.fcmTokenRepository = fcmTokenRepository;
    }

    public void registerToken(User user, String fcmToken) {
        if (fcmToken == null || fcmToken.isBlank()) {
            return;
        }
        String trimmed = fcmToken.trim();
        FcmToken row = fcmTokenRepository.findFirstByUser_Id(user.getId())
                .orElseGet(() -> fcmTokenRepository.findByToken(trimmed).orElse(null));
        if (row != null) {
            row.setToken(trimmed);
            row.setUser(user);
            fcmTokenRepository.save(row);
        } else {
            fcmTokenRepository.save(FcmToken.builder().user(user).token(trimmed).build());
        }
    }

    public String sendToToken(String fcmToken, String title, String body, Map<String, String> data) {
        if (fcmToken == null || fcmToken.isBlank()) {
            log.warn("FCM token is blank; skipping send.");
            return null;
        }
        if (FirebaseApp.getApps().isEmpty()) {
            log.warn("Firebase not initialized; skipping FCM send.");
            return null;
        }
        try {
            Message.Builder builder = Message.builder()
                    .setToken(fcmToken);
            if (title != null || body != null) {
                builder.setNotification(Notification.builder()
                        .setTitle(title != null ? title : "")
                        .setBody(body != null ? body : "")
                        .build());
            }
            if (data != null && !data.isEmpty()) {
                builder.putAllData(data);
            }
            String messageId = FirebaseMessaging.getInstance().send(builder.build());
            log.debug("FCM message sent: {}", messageId);
            return messageId;
        } catch (FirebaseMessagingException e) {
            log.error("FCM send failed for token: {}", fcmToken.substring(0, Math.min(20, fcmToken.length())) + "...", e);
            return null;
        }
    }

    public int sendToUser(UUID userId, String title, String body, Map<String, String> data) {
        return fcmTokenRepository.findFirstByUser_Id(userId)
                .map(ft -> sendToToken(ft.getToken(), title, body, data) != null ? 1 : 0)
                .orElse(0);
    }

    public int sendToUsers(List<UUID> userIds, String title, String body, Map<String, String> data) {
        if (userIds == null || userIds.isEmpty()) {
            return 0;
        }
        int sent = 0;
        for (UUID userId : userIds) {
            sent += sendToUser(userId, title, body, data);
        }
        log.info("Mass notification sent to {} of {} users", sent, userIds.size());
        return sent;
    }

    public int sendToAll(String title, String body, Map<String, String> data) {
        List<FcmToken> tokens = fcmTokenRepository.findAll();
        int sent = 0;
        for (FcmToken ft : tokens) {
            if (sendToToken(ft.getToken(), title, body, data) != null) {
                sent++;
            }
        }
        log.info("Broadcast notification sent to {} of {} devices", sent, tokens.size());
        return sent;
    }
}
