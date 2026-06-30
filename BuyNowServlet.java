package com.woodcraft.controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyNow")
public class BuyNowServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int productId = Integer.parseInt(req.getParameter("productId"));

		int quantity = Integer.parseInt(req.getParameter("quantity"));

		HttpSession session = req.getSession();

		session.setAttribute("buyNowProductId", productId);

		session.setAttribute("buyNowQuantity", quantity);

		resp.sendRedirect(req.getContextPath() + "/checkout");
	}
}