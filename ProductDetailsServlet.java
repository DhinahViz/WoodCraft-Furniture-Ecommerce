package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/productDetails")
public class ProductDetailsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int productId = Integer.parseInt(req.getParameter("productId"));

		ProductDAOImpl dao = new ProductDAOImpl();

		Product product = dao.getProductById(productId);

		List<Product> relatedProducts = dao.getRelatedProducts(product.getCategoryId(), product.getProductId());

		req.setAttribute("relatedProducts", relatedProducts);

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		int cartCount = 0;

		if (user != null) {

			CartDAOImpl cartDao = new CartDAOImpl();

			int cartId = cartDao.getOrCreateCart(user.getUserId());

			cartCount = cartDao.getCartItemCount(cartId);
		}

		req.setAttribute("cartCount", cartCount);

		req.setAttribute("product", product);

		session = req.getSession();

		String previousPage = (String) session.getAttribute("previousPage");

		req.setAttribute("previousPage", previousPage);

		req.getRequestDispatcher("/customer/productDetails.jsp").forward(req, resp);
	}
}