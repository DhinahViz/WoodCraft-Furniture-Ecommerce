package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancelOrder")
public class CancelOrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int orderId = Integer.parseInt(req.getParameter("orderId"));

		OrderDAOImpl dao = new OrderDAOImpl();

		dao.cancelOrder(orderId);

		resp.sendRedirect(req.getContextPath() + "/myOrders");
	}
}