package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.WishlistDAOImpl;
import com.woodcraft.model.Product;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		WishlistDAOImpl wishlistDao = new WishlistDAOImpl();

		List<Product> wishlistProducts = wishlistDao.getWishlistProducts(user.getUserId());

		req.setAttribute("wishlistProducts", wishlistProducts);

		req.getRequestDispatcher("/customer/wishlist.jsp").forward(req, resp);
	}
}