package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.dao.ProductDAO;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/allProducts")
public class AllProductsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductDAO dao = new ProductDAOImpl();

		List<Product> products = dao.getAllProducts();

		req.setAttribute("products", products);

		req.getRequestDispatcher("/customer/allProducts.jsp").forward(req, resp);
	}
}