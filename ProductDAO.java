	package com.woodcraft.dao;
	
	import java.util.List;
	import com.woodcraft.model.Product;
	
	public interface ProductDAO {
	
		boolean addProduct(Product product);
	
		Product getProductById(int productId);
	
		List<Product> getAllProducts();
	
		boolean updateProduct(Product product);
	
		boolean deleteProduct(int productId);
	
		int getStockQuantity(int productId);
	
		boolean reduceStock(int productId, int quantity);
	
		List<Product> getRelatedProducts(int categoryId, int productId);
	
		List<Product> searchProducts(String keyword);
		
		List<Product> getProductsByRoom(int roomCategoryId);
		
		List<Product> getLatestProducts(int limit);
	}