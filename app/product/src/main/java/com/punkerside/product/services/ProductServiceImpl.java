package com.punkerside.product.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.punkerside.product.entity.Product;
import com.punkerside.product.repository.ProductDao;

import jakarta.transaction.Transactional;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	@Transactional
	public List<Product> findAll() {
		return (List<Product>) productDao.findAll();
	}

	@Override
	@Transactional
	public Product save(Product product) {
		return productDao.save(product);
	}

	@Override 
	public Product findById(Long id) {
		return productDao.findById(id).orElse(null);
	}

	@Override
	@Transactional
	public void delete(Product product) {
		productDao.delete(product);	
	}
}