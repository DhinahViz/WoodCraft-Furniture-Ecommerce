package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.dao.ProductDAO;
import com.woodcraft.daoimpl.ProductDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int productId = Integer.parseInt(request.getParameter("productId"));

		ProductDAO dao = new ProductDAOImpl();

		boolean status = dao.deleteProduct(productId);

		if (status) {

			response.sendRedirect(request.getContextPath() + "/admin/deleteSuccess.jsp");

		} else {

			response.getWriter().println("Delete Failed");
		}
	}
}