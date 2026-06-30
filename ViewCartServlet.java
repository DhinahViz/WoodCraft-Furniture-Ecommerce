package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.CartDAOImpl;
import com.woodcraft.model.CartItem;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().setAttribute("previousPage", req.getContextPath() + "/viewCart");
		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect("login.jsp");

			return;
		}

		CartDAOImpl dao = new CartDAOImpl();

		int cartId = dao.getOrCreateCart(user.getUserId());

		List<CartItem> items = dao.getCartItems(cartId);
		int cartCount = dao.getCartItemCount(cartId);

		req.setAttribute("cartCount", cartCount);

		req.setAttribute("cartItems", items);

		req.getRequestDispatcher("/customer/viewCart.jsp").forward(req, resp);
	}
}