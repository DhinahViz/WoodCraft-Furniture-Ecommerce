<%@page import="java.util.List"%>
<%@page import="com.woodcraft.model.CartItem"%>
<%@page import="com.woodcraft.model.User"%>


<%
User user = (User) session.getAttribute("loggedUser");

List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");

double total = 0;

for (CartItem item : cartItems) {

	total += item.getPrice() * item.getQuantity();
}

double delivery = (total >= 10000) ? 0 : 1000;

double finalTotal = total + delivery;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Checkout</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/checkout.css">

</head>


<body>

	<div class="checkout-header">
		<a href="<%=request.getContextPath()%>/viewCart" class="back-btn">
			<i class="fa-solid fa-arrow-left"></i> Back To Cart
		</a>
		<h1>Secure Checkout</h1>

		<p>Complete your order and enjoy premium furniture delivered to
			your doorstep.</p>

	</div>

	<form action="<%=request.getContextPath()%>/payment" method="post">

		<div class="checkout-container">

			<div class="checkout-left">

				<h2>Delivery Information</h2>

				<input type="text" name="customerName" value="<%=user.getName()%>"
					readonly> <input type="email" name="customerEmail"
					value="<%=user.getEmail()%>" readonly> <input type="text"
					name="customerPhone" value="<%=user.getPhone()%>" readonly>

				<textarea name="address"
					placeholder="House / Flat No, Street Address" rows="4" required></textarea>

				<input type="text" name="city" placeholder="City" required>

				<input type="text" name="state" placeholder="State" required>

				<input type="text" name="pincode" placeholder="Pincode" required>
			</div>

			<div class="checkout-right">

				<h2>Order Summary</h2>

				<p>
					Items Total <span>&#8377;<%=total%></span>
				</p>

				<p>
					Premium Delivery <span> <%= delivery == 0 ?
        "FREE" :
        "₹" + delivery %>
					</span>
				</p>

				<hr>

				<h3>
					Total Amount <span>&#8377;<%=finalTotal%></span>
				</h3>

				<%
				double remaining = 10000 - total;
				%>

				<%
				if (total < 10000) {
				%>

				<div class="delivery-message">

					Add products worth &#8377;<%=remaining%>
					more to unlock FREE Premium Delivery.

				</div>

				<%
				} else {
				%>

				<div class="delivery-message">
					<i class="fa-solid fa-gem"></i> Congratulations! You unlocked FREE
					Premium Delivery.
				</div>

				<%
				}
				%>

				<button type="submit" class="place-order-btn">Continue To
					Payment</button>
					

				<div class="trust-badges">

					<p>
						<i class="fa-solid fa-shield-halved"></i> Secure Checkout
					</p>

					<p>
						<i class="fa-solid fa-couch"></i> Premium Furniture Quality
					</p>

					<p>
						<i class="fa-solid fa-truck"></i> Fast Delivery Across India
					</p>

				</div>

			</div>

		</div>
	</form>
</body>
</html>