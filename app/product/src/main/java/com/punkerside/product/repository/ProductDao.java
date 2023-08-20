package com.punkerside.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.punkerside.product.entity.Product;

public interface ProductDao extends JpaRepository<Product, Long> {
    
}