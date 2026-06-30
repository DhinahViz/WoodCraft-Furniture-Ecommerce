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

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("id"));

		ProductDAO dao = new ProductDAOImpl();

		Product product = dao.getProductById(productId);

		request.setAttribute("product", product);

		request.getRequestDispatcher("/admin/editProduct.jsp").forward(request, response);
	}
}