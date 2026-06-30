package com.woodcraft.controller;
import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/roomCategory")
public class RoomCategoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int roomCategoryId = Integer.parseInt(req.getParameter("id"));

		ProductDAOImpl dao = new ProductDAOImpl();

		List<Product> products = dao.getProductsByRoom(roomCategoryId);

		String roomName = "";

		switch (roomCategoryId) {

		case 1:
			roomName = "Living Room";
			break;

		case 2:
			roomName = "Bedroom";
			break;

		case 3:
			roomName = "Dining Room";
			break;

		case 4:
			roomName = "Office Furniture";
			break;

		case 5:
			roomName = "Outdoor Furniture";
			break;

		case 6:
			roomName = "Decor & Accessories";
			break;

		case 7:
			roomName = "Offers";
			break;
		}

		req.setAttribute("products", products);
		req.setAttribute("categoryName", roomName);
		req.setAttribute("productCount", products.size());

		req.getRequestDispatcher("/customer/categoryProducts.jsp").forward(req, resp);
	}
}