<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.woodcraft.model.Order"%>
<%@page import="com.woodcraft.model.OrderItem"%>
<%@page import="com.woodcraft.model.User"%>


<%
User user = (User) session.getAttribute("loggedUser");

List<Order> orders = (List<Order>) request.getAttribute("orders");

Map<Integer, List<OrderItem>> orderItemsMap = (Map<Integer, List<OrderItem>>) request.getAttribute("orderItemsMap");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Orders | WoodCraft</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/myOrders.css">

</head>

<body>

	<div class="orders-page">

		<!-- BACK BUTTON -->

		<a href="<%=request.getContextPath()%>/home" class="back-btn"> <i
			class="fa-solid fa-arrow-left"></i> Back To Home

		</a>

		<!-- PAGE TITLE -->

		<h1 class="page-title">My Orders</h1>

		<!-- EMPTY STATE -->

		<%
		if (orders == null || orders.isEmpty()) {
		%>

		<div class="empty-orders">

			<i class="fa-solid fa-box-open"></i>

			<h2>No Orders Yet</h2>

			<p>Start Shopping Today</p>

			<a href="<%=request.getContextPath()%>/home" class="shop-btn">

				Shop Now </a>

		</div>

		<%
		} else {
		%>

		<!-- ORDERS LOOP -->

		<%
		for (Order order : orders) {

			List<OrderItem> items = orderItemsMap.get(order.getOrderId());
		%>

		<div class="order-card">

			<!-- ORDER HEADER -->

			<div class="order-header">

				<div>

					<span class="label"> ORDER PLACED </span>

					<p>

						<%=order.getOrderDate()%>

					</p>

				</div>

				<div>

					<span class="label"> ORDER ID </span>

					<p>

						#<%=order.getOrderId()%>

					</p>

				</div>

				<div>

					<span class="label"> TOTAL AMOUNT </span>

					<p>

						&#8377;<%=order.getTotalAmount()%>

					</p>

				</div>

			</div>

			<!-- DELIVERY INFO -->

			<div class="delivery-info">

				<div>

					<span class="label"> DELIVER TO </span>

					<p class="customer-name">

						<%=user.getName()%>

					</p>

					<p>

						<%=order.getShippingAddress()%>

					</p>

				</div>

				<div>

					<span class="label"> STATUS </span> <br> <br> <span
						class="status-badge
                <%=order.getOrderStatus().toLowerCase()%>">

						<%=order.getOrderStatus()%>

					</span>

				</div>

			</div>

			<!-- PRODUCTS -->

			<%
			for (OrderItem item : items) {
			%>

			<div class="product-row">

				<div class="product-image">

					<img src="<%=request.getContextPath()%>/<%=item.getImagePath()%>"
						alt="<%=item.getProductName()%>">

				</div>

				<div class="product-details">

					<h3>

						<%=item.getProductName()%>

					</h3>

					<p>

						Quantity : <strong> <%=item.getQuantity()%>

						</strong>

					</p>

					<p>

						Price : <strong> &#8377;<%=item.getPrice()%>

						</strong>

					</p>

				</div>

			</div>

			<%
			}
			%>

			<!-- ACTION BUTTONS -->

			<div class="order-actions">

				<a
					href="<%=request.getContextPath()%>/trackOrder?orderId=<%=order.getOrderId()%>"
					class="track-btn"> <i class="fa-solid fa-location-dot"></i>

					Track Order

				</a>
				<%
				String status = order.getOrderStatus();
				%>

				<%
				if ("PLACED".equals(status) || "PROCESSING".equals(status)) {
				%>

				<a href="javascript:void(0)" class="cancel-btn"
					onclick="openCancelModal(<%=order.getOrderId()%>)"> <i
					class="fa-solid fa-xmark"></i> Cancel Order

				</a>
				<%
				}
				%>

			</div>

		</div>

		<%
		}
		%>

		<%
		}
		%>

	</div>

	<div id="cancelModal" class="modal-overlay">

		<div class="modal-box">

			<h2>Cancel Order</h2>

			<p>Are you sure you want to cancel this order?</p>

			<div class="modal-buttons">

				<button onclick="closeCancelModal()" class="modal-cancel">

					No</button>

				<a id="confirmCancelBtn" href="#" class="modal-confirm"> Yes,
					Cancel </a>

			</div>

		</div>

	</div>
	<script>

function openCancelModal(orderId){

	document.getElementById(
		"cancelModal"
	).style.display = "flex";

	document.getElementById(
		"confirmCancelBtn"
	).href =
	"<%=request.getContextPath()%>/cancelOrder?orderId="
	+ orderId;
}

function closeCancelModal(){

	document.getElementById(
		"cancelModal"
	).style.display = "none";
}

</script>
</body>
</html>