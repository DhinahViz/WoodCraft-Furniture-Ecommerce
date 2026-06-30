package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.dao.ProductDAO;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewProducts")
public class ViewProductsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDAO dao = new ProductDAOImpl();

		List<Product> products = dao.getAllProducts();
		System.out.println("Total Products = " + products.size());

		request.setAttribute("products", products);

		request.getRequestDispatcher("/admin/viewProducts.jsp").forward(request, response);
	}
}