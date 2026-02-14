package com.nexusinfinity.api.product;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.NOT_FOUND;

@RestController
@RequestMapping("/api/products")
public class ProductController {

  private final ProductService productService;

  public ProductController(ProductService productService) {
    this.productService = productService;
  }

  @GetMapping("/barcode/{barcode}")
  public ResponseEntity<ProductResponse> getByBarcode(@PathVariable String barcode) {
    return productService.getByBarcode(barcode)
        .map(ResponseEntity::ok)
        .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(NOT_FOUND, "Product not found"));
  }

  @GetMapping("/search")
  public List<ProductResponse> search(@RequestParam String q) {
    return productService.search(q);
  }

  @GetMapping("/{id}")
  public ResponseEntity<ProductResponse> getById(@PathVariable String id) {
    UUID uuid;
    try {
      uuid = UUID.fromString(id);
    } catch (IllegalArgumentException e) {
      throw new org.springframework.web.server.ResponseStatusException(BAD_REQUEST, "Invalid product id");
    }
    return productService.getById(uuid)
        .map(ResponseEntity::ok)
        .orElseThrow(() -> new org.springframework.web.server.ResponseStatusException(NOT_FOUND, "Product not found"));
  }
}
