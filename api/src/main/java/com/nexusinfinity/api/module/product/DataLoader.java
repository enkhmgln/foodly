package com.nexusinfinity.api.module.product;

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
        Product milk = Product.builder()
                .name("Milk 3.2%")
                .brand("Süü")
                .category("food")
                .barcode("7290012345678")
                .score(75)
                .summary("Good source of calcium. Moderate fat content.")
                .build();
        milk.getIssueTags().add(ProductIssueTag.builder().product(milk).tag("No major concerns").build());
        productRepository.save(milk);

        Product cola = Product.builder()
                .name("Coca-Cola 330ml")
                .brand("Coca-Cola")
                .category("food")
                .barcode("5449000000996")
                .score(15)
                .summary("High in sugar. No nutritional benefit.")
                .build();
        cola.getIssueTags().add(ProductIssueTag.builder().product(cola).tag("High sugar").build());
        cola.getIssueTags().add(ProductIssueTag.builder().product(cola).tag("6 additives").build());
        productRepository.save(cola);

        Product honey = Product.builder()
                .name("Organic Honey")
                .brand("Mongolian Honey Co")
                .category("food")
                .barcode("5060123456789")
                .score(85)
                .summary("Natural product. No additives.")
                .build();
        productRepository.save(honey);
    }
}
