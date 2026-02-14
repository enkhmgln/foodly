package com.nexusinfinity.api.product;

import java.util.List;
import java.util.UUID;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.NOT_FOUND;
import static org.springframework.http.HttpStatus.OK;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nexusinfinity.api.core.response.ApiResponse;

@RestController
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/barcode/{barcode}")
    public ResponseEntity<ApiResponse<ProductResponse>> getByBarcode(@PathVariable String barcode) {
        return productService.getByBarcode(barcode)
                .map(data -> ResponseEntity.status(OK).body(ApiResponse.ok(data)))
                .orElse(ResponseEntity.status(NOT_FOUND).body(ApiResponse.fail("Бүтээгдэхүүн олдсонгүй")));
    }

    @GetMapping("/search")
    public ApiResponse<List<ProductResponse>> search(@RequestParam String q) {
        return ApiResponse.ok(productService.search(q));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ProductResponse>> getById(@PathVariable String id) {
        UUID uuid;
        try {
            uuid = UUID.fromString(id);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(BAD_REQUEST).body(ApiResponse.fail("Буруу бүтээгдэхүүний ID"));
        }
        return productService.getById(uuid)
                .map(data -> ResponseEntity.status(OK).body(ApiResponse.ok(data)))
                .orElse(ResponseEntity.status(NOT_FOUND).body(ApiResponse.fail("Бүтээгдэхүүн олдсонгүй")));
    }
}
