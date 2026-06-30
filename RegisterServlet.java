package com.woodcraft.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.woodcraft.dao.UserDAO;
import com.woodcraft.daoimpl.UserDAOImpl;
import com.woodcraft.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String name = request.getParameter("name");

		String email = request.getParameter("email");

		String phone = request.getParameter("phone");

		String password = request.getParameter("password");

		User user = new User();

		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);

		UserDAO dao = new UserDAOImpl();

		boolean result = dao.registerUser(user);

		if (result) {

			response.sendRedirect("login.jsp");

		} else {

			response.getWriter().println("Registration Failed");
		}
	}
}