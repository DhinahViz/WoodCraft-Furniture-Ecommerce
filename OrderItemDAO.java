package com.woodcraft.dao;

import java.util.List;

import com.woodcraft.model.OrderItem;

public interface OrderItemDAO {

	public boolean addOrderItem(OrderItem item);

	List<OrderItem> getOrderItemsByOrderId(int orderId);

}