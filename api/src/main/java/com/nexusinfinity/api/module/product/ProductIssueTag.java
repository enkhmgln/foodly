package com.nexusinfinity.api.module.product;

import com.nexusinfinity.api.core.entity.BaseEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "product_issue_tag", indexes = {
    @Index(name = "idx_product_issue_tag_product_id", columnList = "product_id")
}, uniqueConstraints = {
    @UniqueConstraint(name = "uk_product_issue_tag_product_tag", columnNames = {"product_id", "tag"})
})
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductIssueTag extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @Column(name = "tag", nullable = false, length = 255)
    private String tag;
}
