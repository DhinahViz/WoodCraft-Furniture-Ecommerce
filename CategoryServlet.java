package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.CategoryDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int categoryId = Integer.parseInt(req.getParameter("id"));

		CategoryDAOImpl dao = new CategoryDAOImpl();

		List<Product> products = dao.getProductsByCategory(categoryId);

		req.setAttribute("products", products);

		String categoryName = "";

		switch (categoryId) {

		case 1:
			categoryName = "Wooden Chairs";
			break;

		case 2:
			categoryName = "Wooden Tables";
			break;

		case 3:
			categoryName = "Wooden Beds";
			break;

		case 4:
			categoryName = "Wooden Sofas";
			break;

		case 5:
			categoryName = "Wooden Decor";
			break;
		}

		req.setAttribute("categoryName", categoryName);
		
		req.setAttribute("productCount", products.size());

		req.getRequestDispatcher("/customer/categoryProducts.jsp").forward(req, resp);
	}
}