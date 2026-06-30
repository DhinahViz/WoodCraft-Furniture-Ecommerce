package com.woodcraft.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.woodcraft.daoimpl.OrderDAOImpl;
import com.woodcraft.daoimpl.OrderItemDAOImpl;
import com.woodcraft.model.Order;
import com.woodcraft.model.OrderItem;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		OrderDAOImpl orderDAO = new OrderDAOImpl();

		List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());

		OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();

		Map<Integer, List<OrderItem>> orderItemsMap = new HashMap<>();

		for (Order order : orders) {

			List<OrderItem> items = orderItemDAO.getOrderItemsByOrderId(order.getOrderId());

			orderItemsMap.put(order.getOrderId(), items);
		}

		req.setAttribute("orders", orders);
		req.setAttribute("orderItemsMap", orderItemsMap);
		req.getRequestDispatcher("/customer/myOrders.jsp").forward(req, resp);
	}
}