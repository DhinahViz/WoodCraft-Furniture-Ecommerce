package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.UserDAOImpl;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		req.setAttribute("user", user);

		req.getRequestDispatcher("/customer/editProfile.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User loggedUser = (User) session.getAttribute("loggedUser");

		String name = req.getParameter("name");

		String email = req.getParameter("email");

		String phone = req.getParameter("phone");

		User user = new User();

		user.setUserId(loggedUser.getUserId());

		user.setName(name);

		user.setEmail(email);

		user.setPhone(phone);

		UserDAOImpl dao = new UserDAOImpl();

		boolean updated = dao.updateUser(user);

		if (updated) {

			loggedUser.setName(name);

			loggedUser.setEmail(email);

			loggedUser.setPhone(phone);

			session.setAttribute("loggedUser", loggedUser);

			session.setAttribute("profileSuccess", "Profile updated successfully.");

		}

		resp.sendRedirect(req.getContextPath() + "/profile");
	}
}