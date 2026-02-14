package com.nexusinfinity.api.product;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "products", indexes = {
    @Index(name = "idx_products_barcode", columnList = "barcode", unique = true),
    @Index(name = "idx_products_name", columnList = "name")
})
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {

  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false)
  private String brand;

  @Column(nullable = false, length = 50)
  private String category;

  @Column(nullable = false, unique = true, length = 100)
  private String barcode;

  @Column(nullable = false)
  private int score;

  @Column(length = 2000)
  private String summary;

  @ElementCollection(fetch = FetchType.EAGER)
  @CollectionTable(name = "product_issue_tags", joinColumns = @JoinColumn(name = "product_id"))
  @Column(name = "tag")
  @Builder.Default
  private List<String> issueTags = new ArrayList<>();

  @Column(length = 500)
  private String imageUrl;
}
