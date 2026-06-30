package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.CartDAOImpl;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			session.setAttribute("redirectAfterLogin",
					req.getContextPath() + "/productDetails?productId=" + req.getParameter("productId"));

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));

		int quantity = Integer.parseInt(req.getParameter("quantity"));

		ProductDAOImpl productDAO = new ProductDAOImpl();

		Product product = productDAO.getProductById(productId);

		if (quantity > product.getStockQuantity()) {

			req.setAttribute("product", product);

			req.setAttribute("stockError",

					"Only " + product.getStockQuantity() + " items available in stock.");

			req.getRequestDispatcher("/customer/productDetails.jsp").forward(req, resp);

			return;
		}
		CartDAOImpl dao = new CartDAOImpl();

		int cartId = dao.getOrCreateCart(user.getUserId());

		int stockQty = productDAO.getStockQuantity(productId);

		int existingQty = dao.getExistingQuantity(cartId, productId);

		int totalRequested = existingQty + quantity;

		if (totalRequested > stockQty) {

			session.setAttribute("cartError",

					"Only " + stockQty + " items available in stock.");

			resp.sendRedirect(

					"productDetails?productId=" + productId);

			return;
		}

		dao.addToCart(cartId, productId, quantity);

		session.setAttribute("cartSuccess", "Product Added To Cart Successfully!");

		resp.sendRedirect("productDetails?productId=" + productId);

		return;
	}
}