package com.nexusinfinity.api.module.product;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Optional<ProductResponse> getByBarcode(String barcode) {
        return productRepository.findByBarcode(barcode)
                .map(ProductResponse::fromEntity);
    }

    public List<ProductResponse> search(String q) {
        if (q == null || q.isBlank()) {
            return List.of();
        }
        return productRepository.search(q.trim()).stream()
                .map(ProductResponse::fromEntity)
                .toList();
    }

    public Optional<ProductResponse> getById(UUID id) {
        return productRepository.findById(id)
                .map(ProductResponse::fromEntity);
    }
}
