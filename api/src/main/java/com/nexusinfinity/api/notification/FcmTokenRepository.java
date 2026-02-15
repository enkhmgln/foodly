package com.nexusinfinity.api.notification;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FcmTokenRepository extends JpaRepository<FcmToken, UUID> {

    Optional<FcmToken> findByToken(String token);

    Optional<FcmToken> findFirstByUser_Id(UUID userId);

    void deleteByToken(String token);
}
