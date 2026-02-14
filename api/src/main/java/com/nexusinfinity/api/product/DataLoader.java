package com.nexusinfinity.api.product;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataLoader implements CommandLineRunner {

    private final ProductRepository productRepository;

    public DataLoader(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public void run(String... args) {
        if (productRepository.count() > 0) {
            return;
        }
        productRepository.saveAll(List.of(
                Product.builder()
                        .name("Milk 3.2%")
                        .brand("Süü")
                        .category("food")
                        .barcode("7290012345678")
                        .score(75)
                        .summary("Good source of calcium. Moderate fat content.")
                        .issueTags(List.of("No major concerns"))
                        .build(),
                Product.builder()
                        .name("Coca-Cola 330ml")
                        .brand("Coca-Cola")
                        .category("food")
                        .barcode("5449000000996")
                        .score(15)
                        .summary("High in sugar. No nutritional benefit.")
                        .issueTags(List.of("High sugar", "6 additives"))
                        .build(),
                Product.builder()
                        .name("Organic Honey")
                        .brand("Mongolian Honey Co")
                        .category("food")
                        .barcode("5060123456789")
                        .score(85)
                        .summary("Natural product. No additives.")
                        .issueTags(List.of())
                        .build()
        ));
    }
}
