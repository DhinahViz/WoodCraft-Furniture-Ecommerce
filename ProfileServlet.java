package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		req.getRequestDispatcher("/customer/profile.jsp").forward(req, resp);
	}
}