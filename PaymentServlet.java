package com.woodcraft.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String pincode = req.getParameter("pincode");

		HttpSession session = req.getSession();

		session.setAttribute("address", address);
		session.setAttribute("city", city);
		session.setAttribute("state", state);
		session.setAttribute("pincode", pincode);
		req.getRequestDispatcher("/customer/payment.jsp").forward(req, resp);
	}
}