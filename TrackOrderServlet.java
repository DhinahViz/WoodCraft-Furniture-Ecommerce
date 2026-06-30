package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.OrderDAOImpl;
import com.woodcraft.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/trackOrder")
public class TrackOrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int orderId = Integer.parseInt(req.getParameter("orderId"));

		OrderDAOImpl dao = new OrderDAOImpl();

		Order order = dao.getOrderById(orderId);

		req.setAttribute("order", order);

		req.getRequestDispatcher("/customer/trackOrder.jsp").forward(req, resp);
	}
}