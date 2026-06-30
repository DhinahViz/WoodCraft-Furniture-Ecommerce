<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Integer orderId = (Integer) session.getAttribute("orderId");

Double orderAmount = (Double) session.getAttribute("orderAmount");

if (orderId == null) {
	response.sendRedirect(request.getContextPath() + "/home");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Order Success | WoodCraft</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/orderSuccess.css">

</head>

<body>

	<div class="success-card">

		<div class="success-icon">

			<i class="fa-solid fa-check"></i>

		</div>

		<h1>Order Placed Successfully!</h1>

		<p>Thank you for choosing WoodCraft. Your premium furniture order
			has been placed successfully.</p>

		<div class="order-info">

			<p>

				<strong>Order ID:</strong> #<%=orderId%>

			</p>

			<p>

				<strong>Total Amount:</strong> ₹<%=String.format("%.2f", orderAmount)%>

			</p>

			<p>

				<strong>Status:</strong> PLACED

			</p>

		</div>

		<div class="order-message">

			<i class="fa-solid fa-truck-fast"></i> Our team will contact you
			shortly regarding delivery and installation.

		</div>

		<a href="<%=request.getContextPath()%>/home" class="home-btn"> <i
			class="fa-solid fa-house"></i> Continue Shopping

		</a>

	</div>
	<%
	session.removeAttribute("orderId");
	session.removeAttribute("orderAmount");
	%>
</body>
</html>