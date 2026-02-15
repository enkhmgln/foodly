package com.nexusinfinity.api.notification;

import com.nexusinfinity.api.core.entity.BaseEntity;
import com.nexusinfinity.api.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "notification_fcmtoken", indexes = {
    @jakarta.persistence.Index(name = "idx_notification_fcmtoken_token", columnList = "token", unique = true),
    @jakarta.persistence.Index(name = "idx_notification_fcmtoken_user_id", columnList = "user_id", unique = true)
}, uniqueConstraints = {
    @UniqueConstraint(name = "uk_notification_fcmtoken_user_id", columnNames = "user_id")
})
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FcmToken extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false, unique = true, length = 512)
    private String token;

    public void setUser(User user) {
        this.user = user;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
