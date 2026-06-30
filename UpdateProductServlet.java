package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.dao.ProductDAO;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateProduct")
public class UpdateProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("productId"));

		String productName = request.getParameter("productName");

		double price = Double.parseDouble(request.getParameter("price"));

		Product product = new Product();

		product.setProductId(productId);
		product.setProductName(productName);
		product.setPrice(price);

		ProductDAO dao = new ProductDAOImpl();

		boolean status = dao.updateProduct(product);

		if (status) {

			response.sendRedirect(request.getContextPath() + "/admin/updateSuccess.jsp");

		} else {

			response.getWriter().println("Update Failed");
		}
	}
}