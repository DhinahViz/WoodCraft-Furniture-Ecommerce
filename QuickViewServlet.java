package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/quickView")
public class QuickViewServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int productId = Integer.parseInt(req.getParameter("productId"));

		ProductDAOImpl dao = new ProductDAOImpl();

		Product product = dao.getProductById(productId);

		resp.setContentType("application/json");

		resp.setCharacterEncoding("UTF-8");

		if (product != null) {

			String json = "{" + "\"productId\":" + product.getProductId() + "," + "\"productName\":\""
					+ product.getProductName() + "\"," + "\"price\":" + product.getPrice() + "," + "\"stock\":"
					+ product.getStockQuantity() + "," + "\"imagePath\":\"" + product.getImagePath() + "\","
					+ "\"description\":\"" + product.getDescription() + "\"" + "}";

			resp.getWriter().write(json);
		}
	}
}