package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.dao.UserDAO;
import com.woodcraft.daoimpl.UserDAOImpl;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		UserDAO dao = new UserDAOImpl();

		User user = dao.loginUser(email, password);

		if (user != null) {

			HttpSession session = request.getSession();

			session.setAttribute("loggedUser", user);

			if (user.getRole().equals("ADMIN")) {

				response.sendRedirect("admin/dashboard.jsp");

			} else {

				String redirectUrl = (String) session.getAttribute("redirectAfterLogin");

				if (redirectUrl != null) {

					session.removeAttribute("redirectAfterLogin");

					response.sendRedirect(redirectUrl);

				} else {

					response.sendRedirect("home");

				}
			}

		} else {

			response.getWriter().println("Invalid Email Or Password");
		}
	}
}