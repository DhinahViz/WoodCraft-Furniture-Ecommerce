<%@page import="com.woodcraft.model.Order"%>

<%
Order order = (Order) request.getAttribute("order");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Track Order</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/trackOrder.css">

</head>

<body>

	<div class="track-container">

		<a href="<%=request.getContextPath()%>/myOrders" class="back-btn">

			<i class="fa-solid fa-arrow-left"></i> Back To Orders

		</a>

		<h1>

			Order #<%=order.getOrderId()%>

		</h1>

		<p class="status-text">

			Current Status: <strong> <%=order.getOrderStatus()%>
			</strong>

		</p>

		<div class="order-info">

			<p>
				<strong>Order ID:</strong> #<%=order.getOrderId()%>
			</p>

			<p>
				<strong>Total Amount:</strong> &#8377;<%=order.getTotalAmount()%>
			</p>

			<p>
				<strong>Shipping Address:</strong>
				<%=order.getShippingAddress()%>
			</p>

			<p>
				<strong>Order Date:</strong>
				<%=order.getOrderDate()%>
			</p>

		</div>

		<div class="timeline">

			<div
				class="step
		<%=!"".equals(order.getOrderStatus()) ? "active" : ""%>">

				PLACED</div>

			<div
				class="step
		<%=("PROCESSING".equals(order.getOrderStatus()) || "SHIPPED".equals(order.getOrderStatus())
		|| "DELIVERED".equals(order.getOrderStatus())) ? "active" : ""%>">

				PROCESSING</div>

			<div
				class="step
		<%=("SHIPPED".equals(order.getOrderStatus()) || "DELIVERED".equals(order.getOrderStatus())) ? "active" : ""%>">

				SHIPPED</div>

			<div
				class="step
		<%="DELIVERED".equals(order.getOrderStatus()) ? "active" : ""%>">

				DELIVERED</div>

		</div>

	</div>

</body>

</html>