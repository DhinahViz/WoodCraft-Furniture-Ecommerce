package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.CartDAOImpl;
import com.woodcraft.daoimpl.ProductDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int cartItemId = Integer.parseInt(req.getParameter("cartItemId"));

		int quantity = Integer.parseInt(req.getParameter("quantity"));

		CartDAOImpl dao = new CartDAOImpl();

		// Get product id from cart item
		int productId = dao.getProductIdByCartItemId(cartItemId);
		
		System.out.println("Cart Item Id = " + cartItemId);
		System.out.println("Product Id = " + productId);

		ProductDAOImpl productDAO = new ProductDAOImpl();

		int stockQty = productDAO.getStockQuantity(productId);
		System.out.println("Stock Qty = " + stockQty);

		if (quantity > stockQty) {

			req.getSession().setAttribute("cartError", "Only " + stockQty + " items available in stock.");

			resp.sendRedirect(req.getContextPath() + "/viewCart");

			return;
		}

		if (quantity > 0) {

			dao.updateCartQuantity(cartItemId, quantity);
		}

		resp.sendRedirect(req.getContextPath() + "/viewCart");
	}
}
