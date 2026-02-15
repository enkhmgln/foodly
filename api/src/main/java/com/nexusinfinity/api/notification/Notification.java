package com.nexusinfinity.api.notification;

import java.time.Instant;

import com.nexusinfinity.api.core.entity.BaseEntity;
import com.nexusinfinity.api.user.User;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "notification", indexes = {
    @jakarta.persistence.Index(name = "idx_notification_user_id", columnList = "user_id"),
    @jakarta.persistence.Index(name = "idx_notification_created_at", columnList = "created_at")
})
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notification extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Column(nullable = false, length = 255)
    private String title;

    @Column(length = 2000)
    private String body;

    @Column(name = "data_json", length = 2000)
    private String dataJson;

    @Column(name = "read_at")
    private Instant readAt;

    public void setUser(User user) {
        this.user = user;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public void setDataJson(String dataJson) {
        this.dataJson = dataJson;
    }

    public void setReadAt(Instant readAt) {
        this.readAt = readAt;
    }
}
