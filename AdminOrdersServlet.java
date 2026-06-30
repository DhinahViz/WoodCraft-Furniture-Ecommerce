package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.OrderDAOImpl;
import com.woodcraft.model.Order;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin/orders")
public class AdminOrdersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		OrderDAOImpl orderDAO = new OrderDAOImpl();

		List<Order> orders = orderDAO.getAllOrders();

		req.setAttribute("orders", orders);

		req.getRequestDispatcher("/admin/orders.jsp").forward(req, resp);
	}
}