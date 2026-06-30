package com.woodcraft.dao;

import java.util.List;

import com.woodcraft.model.Product;

public interface WishlistDAO {

	boolean addToWishlist(int userId, int productId);

	boolean removeFromWishlist(int userId, int productId);

	boolean isInWishlist(int userId, int productId);
	
	List<Product> getWishlistProducts(int userId);
}