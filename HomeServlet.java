package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.dao.ProductDAO;
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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("previousPage", request.getContextPath() + "/home");
		ProductDAO dao = new ProductDAOImpl();

		List<Product> products = dao.getLatestProducts(8);

		request.setAttribute("products", products);
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("loggedUser");

		int cartCount = 0;

		if (user != null) {

			CartDAOImpl cartDao = new CartDAOImpl();

			int cartId = cartDao.getOrCreateCart(user.getUserId());

			cartCount = cartDao.getCartItemCount(cartId);
		}

		request.setAttribute("cartCount", cartCount);

		request.getRequestDispatcher("/customer/home.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}