package com.woodcraft.dao;

import java.util.List;

import com.woodcraft.model.CartItem;

public interface CartDAO {

	public int getOrCreateCart(int userId);

	public boolean addToCart(int cartId, int productId, int quantity);

	public List<CartItem> getCartItems(int cartId);

	public int getCartItemCount(int cartId);

	boolean updateCartQuantity(int cartItemId, int quantity);

	int getExistingQuantity(int cartId, int productId);

	public int getProductIdByCartItemId(int cartItemId);

	boolean removeCartItem(int cartItemId);
	
	public boolean clearCart(int cartId);

}