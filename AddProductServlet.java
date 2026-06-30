package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.dao.ProductDAO;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String productName = request.getParameter("productName");

		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		String description = request.getParameter("description");

		double price = Double.parseDouble(request.getParameter("price"));

		int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));

		String imagePath = request.getParameter("imagePath");

		Product product = new Product();

		product.setProductName(productName);

		product.setCategoryId(categoryId);

		product.setDescription(description);

		product.setPrice(price);

		product.setStockQuantity(stockQuantity);

		product.setImagePath(imagePath);

		ProductDAO dao = new ProductDAOImpl();

		boolean result = dao.addProduct(product);

		if (result) {
			response.sendRedirect("admin/productSuccess.jsp");
		} else {

			response.getWriter().println("Failed To Add Product");
		}
	}
}