package com.punkerside.product.services;

import java.util.List;
import com.punkerside.product.entity.Product;

public interface ProductService {
	public List<Product> findAll();
	public Product save(Product product);
	public Product findById(Long id);	
	public void delete(Product product);
}