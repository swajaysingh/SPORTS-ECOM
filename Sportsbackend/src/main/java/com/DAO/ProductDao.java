package com.DAO;

import java.util.List;

import com.model.Product;

public interface ProductDao {
	public boolean addProduct(Product product);

	public List<Product> retriveProduct();
	public boolean deleteProduct(Product product);
	public Product getProduct(int productId);
	public boolean updateProduct(Product product);
}
