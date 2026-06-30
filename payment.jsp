<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Payment | WoodCraft</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/payment.css">

</head>

<body>

	<div class="payment-container">

		<a href="<%=request.getContextPath()%>/checkout" class="back-btn">

			<i class="fa-solid fa-arrow-left"></i> Back To Checkout

		</a>

		<h1>Select Payment Method</h1>

		<p class="subtitle">Secure payment for your premium furniture
			purchase</p>

		<form action="<%=request.getContextPath()%>/placeOrder" method="post">

			<div class="payment-option">

				<input type="radio" name="paymentMethod" value="COD" checked>

				<div>

					<h3>Cash On Delivery</h3>

					<p>Pay when your order arrives</p>

				</div>

			</div>

			<div class="payment-option disabled">

				<input type="radio" disabled>

				<div>

					<h3>UPI</h3>

					<p>Coming Soon</p>

				</div>

			</div>

			<div class="payment-option disabled">

				<input type="radio" disabled>

				<div>

					<h3>Credit / Debit Card</h3>

					<p>Coming Soon</p>

				</div>

			</div>

			<button type="submit" class="confirm-btn">Confirm Payment</button>

		</form>

	</div>

</body>
</html>