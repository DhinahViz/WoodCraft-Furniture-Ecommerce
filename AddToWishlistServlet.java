package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.WishlistDAOImpl;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToWishlist")
public class AddToWishlistServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		int productId = Integer.parseInt(req.getParameter("productId"));

		WishlistDAOImpl wishlistDAO = new WishlistDAOImpl();

		// Prevent duplicate wishlist entries
		if (!wishlistDAO.isInWishlist(user.getUserId(), productId)) {

			wishlistDAO.addToWishlist(user.getUserId(), productId);

			session.setAttribute("successMessage", "Product added to wishlist ❤️");

		} else {

			session.setAttribute("successMessage", "Product already exists in wishlist ❤️");
		}

		resp.sendRedirect(req.getHeader("referer"));
	}
}