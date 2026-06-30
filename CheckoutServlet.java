package com.woodcraft.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.woodcraft.daoimpl.CartDAOImpl;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.CartItem;
import com.woodcraft.model.Product;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		// BUY NOW CHECK

		Integer buyNowProductId = (Integer) session.getAttribute("buyNowProductId");

		Integer buyNowQuantity = (Integer) session.getAttribute("buyNowQuantity");

		if (buyNowProductId != null && buyNowQuantity != null) {

			ProductDAOImpl productDAO = new ProductDAOImpl();

			Product product = productDAO.getProductById(buyNowProductId);

			if (product != null) {

				List<CartItem> cartItems = new ArrayList<>();

				CartItem item = new CartItem();

				item.setProductId(product.getProductId());

				item.setProductName(product.getProductName());

				item.setPrice(product.getPrice());

				item.setQuantity(buyNowQuantity);

				item.setImagePath(product.getImagePath());

				cartItems.add(item);

				req.setAttribute("cartItems", cartItems);

				req.setAttribute("isBuyNow", true);

				req.getRequestDispatcher("/customer/checkout.jsp").forward(req, resp);

				return;
			}
		}

		// NORMAL CART CHECKOUT

		CartDAOImpl cartDAO = new CartDAOImpl();

		int cartId = cartDAO.getOrCreateCart(user.getUserId());

		List<CartItem> cartItems = cartDAO.getCartItems(cartId);

		req.setAttribute("cartItems", cartItems);

		req.setAttribute("isBuyNow", false);

		req.getRequestDispatcher("/customer/checkout.jsp").forward(req, resp);
	}
}