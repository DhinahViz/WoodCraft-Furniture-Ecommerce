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
	
	@WebServlet("/search")
	public class SearchServlet extends HttpServlet {
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
			String keyword = req.getParameter("keyword");
	
			ProductDAOImpl dao = new ProductDAOImpl();
	
			List<Product> products = dao.searchProducts(keyword);
	
			req.setAttribute("products", products);
	
			req.setAttribute("keyword", keyword);
	
			req.getRequestDispatcher("/customer/searchResults.jsp").forward(req, resp);
		}
	}