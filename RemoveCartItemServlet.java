package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.CartDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/removeCartItem")
public class RemoveCartItemServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int cartItemId = Integer.parseInt(req.getParameter("cartItemId"));

		CartDAOImpl dao = new CartDAOImpl();

		dao.removeCartItem(cartItemId);

		req.getSession().setAttribute("cartSuccess", "Product removed successfully.");

		resp.sendRedirect(req.getContextPath() + "/viewCart");
	}
}
