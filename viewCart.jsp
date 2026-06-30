<%@ page import="java.util.List"%>
<%@ page import="com.woodcraft.model.CartItem"%>


<%
List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>WoodCraft Cart</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/viewCart.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>
	<a href="javascript:history.back();" class="back-btn"> <i
		class="fa-solid fa-arrow-left"></i> Back

	</a>

	<div class="cart-container">
		<%
		String cartError = (String) session.getAttribute("cartError");

		session.removeAttribute("cartError");
		%>

		<%
		if (cartError != null) {
		%>

		<div class="cart-error">
			<%=cartError%>
		</div>

		<%
		}
		%>
		<h1>Your Shopping Cart</h1>

		<%
		if (cartItems == null || cartItems.isEmpty()) {
		%>

		<div class="empty-cart">

			<i class="fa-solid fa-cart-shopping"></i>

			<h2>Your Cart Is Empty</h2>

			<p>Add beautiful furniture to your cart.</p>

			<a href="<%=request.getContextPath()%>/home" class="continue-btn">

				Continue Shopping </a>

		</div>

		<%
		} else {

		double grandTotal = 0;
		%>

		<table class="cart-table">

			<tr>

				<th>Image</th>

				<th>Product</th>

				<th>Price</th>

				<th>Quantity</th>

				<th>Total</th>

				<th>Action</th>

			</tr>

			<%
			for (CartItem item : cartItems) {

				double total = item.getPrice() * item.getQuantity();

				grandTotal += total;
			%>

			<tr>

				<td><a
					href="<%=request.getContextPath()%>/productDetails?id=<%=item.getProductId()%>&from=cart">

						<img src="<%=request.getContextPath()%>/<%=item.getImagePath()%>"
						class="cart-image">

				</a></td>

				<td><%=item.getProductName()%></td>

				<td>&#8377;<%=item.getPrice()%>

				</td>

				<td>

					<div class="qty-controls">

						<a
							href="<%=request.getContextPath()%>/updateCartQuantity?cartItemId=<%=item.getCartItemId()%>&quantity=<%=item.getQuantity() - 1%>"
							class="qty-btn"> - </a> <span class="qty-value"> <%=item.getQuantity()%>

						</span> <a
							href="<%=request.getContextPath()%>/updateCartQuantity?cartItemId=<%=item.getCartItemId()%>&quantity=<%=item.getQuantity() + 1%>"
							class="qty-btn"> + </a>

					</div>

				</td>

				<td>&#8377;<%=total%>

				</td>

				<td><a href="javascript:void(0)" class="remove-btn"
					onclick="openModal(<%=item.getCartItemId()%>)"> <i
						class="fa-solid fa-trash"></i> Remove

				</a></td>

			</tr>

			<%
			}
			%>

		</table>

		<%
		int totalItems = 0;

		for (CartItem item : cartItems) {
			totalItems += item.getQuantity();
		}

		double shippingCharge = 0;

		if (grandTotal < 10000) {
			shippingCharge = 1000;
		}

		double discount = 0;

		double finalAmount = grandTotal + shippingCharge - discount;
		%>


		<div class="summary-card">

			<h2>Order Summary</h2>

			<div class="summary-row">

				<span>Items (<%=totalItems%>)
				</span> <span>&#8377;<%=grandTotal%></span>

			</div>

			<div class="summary-row">

				<span>Premium Delivery</span> <span> <%
 if (shippingCharge == 0) {
 %> <span class="free-delivery"> FREE </span> <%
 } else {
 %> &#8377;<%=shippingCharge%> <%
 }
 %>

				</span>

			</div>

			<div class="summary-row">

				<span>Discount</span> <span>-&#8377;<%=discount%></span>

			</div>

			<hr>

			<div class="summary-total">

				<span>Total Amount</span> <span>&#8377;<%=finalAmount%></span>

			</div>

			<%
			if (shippingCharge == 0) {
			%>

			<div class="delivery-message">
				<i class="fa-solid fa-gem"></i> Congratulations! You unlocked FREE
				Premium Delivery.
			</div>

			<%
			} else {
			%>

			<div class="delivery-message pending">

				Add products worth &#8377;<%=10000 - grandTotal%>
				more to unlock FREE Premium Delivery.

			</div>

			<%
			}
			%>

			<a href="<%=request.getContextPath()%>/checkout" class="checkout-btn">

				Proceed To Checkout </a>

		</div>
		<%
		}
		%>


	</div>

	<div id="removeModal" class="modal-overlay">

		<div class="modal-box">

			<h2>Remove Product</h2>

			<p>Are you sure you want to remove this product from your cart?</p>

			<div class="modal-buttons">

				<button class="cancel-btn" onclick="closeModal()">Cancel</button>

				<a id="confirmRemoveBtn" href="#" class="confirm-remove-btn">

					Remove </a>

			</div>

		</div>

	</div>

	<script>

function openModal(cartItemId){

    document.getElementById("removeModal")
            .style.display = "flex";

    document.getElementById("confirmRemoveBtn")
            .href =
    "<%=request.getContextPath()%>/removeCartItem?cartItemId="
    + cartItemId;
}

function closeModal(){

    document.getElementById("removeModal")
            .style.display = "none";
}

window.onclick = function(event){

    let modal =
        document.getElementById("removeModal");

    if(event.target == modal){

        closeModal();
    }
}

document.addEventListener("keydown",
function(event){

    if(event.key === "Escape"){

        closeModal();
    }
});

</script>

</body>
</html>
