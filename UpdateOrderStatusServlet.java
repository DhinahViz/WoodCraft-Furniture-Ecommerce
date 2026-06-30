package com.woodcraft.controller;
import java.io.IOException;

import com.woodcraft.daoimpl.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int orderId = Integer.parseInt(req.getParameter("orderId"));

		String status = req.getParameter("status");

		OrderDAOImpl orderDAO = new OrderDAOImpl();

		boolean updated = orderDAO.updateOrderStatus(orderId, status);

		HttpSession session = req.getSession();

		if (updated) {

			session.setAttribute("successMessage", "Order #" + orderId + " updated to " + status);

		} else {

			session.setAttribute("successMessage", "Failed to update order.");
		}

		resp.sendRedirect(req.getContextPath() + "/admin/orders");
	}
}