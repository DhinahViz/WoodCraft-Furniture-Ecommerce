package com.woodcraft.controller;

import java.io.IOException;

import com.woodcraft.daoimpl.SubscriberDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/subscribe")
public class SubscribeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");

		SubscriberDAOImpl dao = new SubscriberDAOImpl();

		boolean success = dao.subscribe(email);

		if (success) {

			resp.sendRedirect(req.getContextPath() + "/home?subscribed=true#newsletter");

		} else {

			resp.sendRedirect(req.getContextPath() + "/home?subscribed=false#newsletter");
		}
	}
}