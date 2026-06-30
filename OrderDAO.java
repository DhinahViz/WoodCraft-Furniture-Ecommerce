package com.woodcraft.dao;

import java.util.List;

import com.woodcraft.model.Order;

public interface OrderDAO {

	int createOrder(Order order);

	List<Order> getOrdersByUserId(int userId);

	List<Order> getAllOrders();

	boolean updateOrderStatus(int orderId, String status);
	
	Order getOrderById(int orderId);
	
	boolean cancelOrder(int orderId);
}