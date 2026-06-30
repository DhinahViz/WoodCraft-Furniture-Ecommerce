package com.woodcraft.controller;

import java.io.IOException;
import java.util.List;

import com.woodcraft.daoimpl.CartDAOImpl;
import com.woodcraft.daoimpl.OrderDAOImpl;
import com.woodcraft.daoimpl.OrderItemDAOImpl;
import com.woodcraft.daoimpl.ProductDAOImpl;
import com.woodcraft.model.CartItem;
import com.woodcraft.model.Order;
import com.woodcraft.model.OrderItem;
import com.woodcraft.model.Product;
import com.woodcraft.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect(req.getContextPath() + "/login.jsp");

			return;
		}

		// ADDRESS

		String address = (String) session.getAttribute("address");

		String city = (String) session.getAttribute("city");

		String state = (String) session.getAttribute("state");

		String pincode = (String) session.getAttribute("pincode");

		String fullAddress = address + ", " + city + ", " + state + " - " + pincode;

		OrderDAOImpl orderDAO = new OrderDAOImpl();

		OrderItemDAOImpl orderItemDAO = new OrderItemDAOImpl();

		ProductDAOImpl productDAO = new ProductDAOImpl();

		// BUY NOW CHECK

		Integer buyNowProductId = (Integer) session.getAttribute("buyNowProductId");

		Integer buyNowQuantity = (Integer) session.getAttribute("buyNowQuantity");

		int orderId = 0;
		double finalAmount = 0;

		if (buyNowProductId != null && buyNowQuantity != null) {

			Product product = productDAO.getProductById(buyNowProductId);

			if (product != null) {

				double total = product.getPrice() * buyNowQuantity;

				double delivery = (total >= 10000) ? 0 : 1000;

				finalAmount = total + delivery;

				Order order = new Order();

				order.setUserId(user.getUserId());

				order.setTotalAmount(finalAmount);

				order.setOrderStatus("PLACED");

				order.setShippingAddress(fullAddress);

				orderId = orderDAO.createOrder(order);

				OrderItem orderItem = new OrderItem();

				orderItem.setOrderId(orderId);

				orderItem.setProductId(product.getProductId());

				orderItem.setQuantity(buyNowQuantity);

				orderItem.setPrice(product.getPrice());

				orderItemDAO.addOrderItem(orderItem);

				productDAO.reduceStock(product.getProductId(), buyNowQuantity);

				// REMOVE BUY NOW DATA

				session.removeAttribute("buyNowProductId");

				session.removeAttribute("buyNowQuantity");
			}

		} else {

			// NORMAL CART ORDER

			CartDAOImpl cartDAO = new CartDAOImpl();

			int cartId = cartDAO.getOrCreateCart(user.getUserId());

			List<CartItem> cartItems = cartDAO.getCartItems(cartId);

			double totalAmount = 0;

			for (CartItem item : cartItems) {

				totalAmount += item.getPrice() * item.getQuantity();
			}

			double delivery = (totalAmount >= 10000) ? 0 : 1000;

			finalAmount = totalAmount + delivery;

			Order order = new Order();

			order.setUserId(user.getUserId());

			order.setTotalAmount(finalAmount);

			order.setOrderStatus("PLACED");

			order.setShippingAddress(fullAddress);

			orderId = orderDAO.createOrder(order);

			for (CartItem cartItem : cartItems) {

				OrderItem orderItem = new OrderItem();

				orderItem.setOrderId(orderId);

				orderItem.setProductId(cartItem.getProductId());

				orderItem.setQuantity(cartItem.getQuantity());

				orderItem.setPrice(cartItem.getPrice());

				orderItemDAO.addOrderItem(orderItem);

				productDAO.reduceStock(cartItem.getProductId(), cartItem.getQuantity());
			}

			cartDAO.clearCart(cartId);
		}

		// CLEANUP ADDRESS DATA

		session.removeAttribute("address");
		session.removeAttribute("city");
		session.removeAttribute("state");
		session.removeAttribute("pincode");

		// SUCCESS PAGE

		session.setAttribute("orderId", orderId);

		session.setAttribute("orderAmount", finalAmount);

		resp.sendRedirect(req.getContextPath() + "/customer/orderSuccess.jsp");
	}
}