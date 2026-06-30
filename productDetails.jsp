<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.woodcraft.model.Product"%>
<%@page import="java.util.List"%>


<%
Product product = (Product) request.getAttribute("product");
List<Product> relatedProducts = (List<Product>) request.getAttribute("relatedProducts");
%>

<%
int maxStock = product.getStockQuantity();
%>

<%
String successMessage = (String) session.getAttribute("cartSuccess");
String stockError = (String) request.getAttribute("stockError");
session.removeAttribute("cartSuccess");

String errorMessage = (String) session.getAttribute("cartError");
session.removeAttribute("cartError");
%>


<%
String from = request.getParameter("from");

String backUrl = request.getContextPath() + "/home";

if ("cart".equals(from)) {
	backUrl = request.getContextPath() + "/viewCart";
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=product.getProductName()%></title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/productDetails.css">

</head>

<body>

	<a href="javascript:history.back();" class="back-btn"> <i
		class="fa-solid fa-arrow-left"></i> Back

	</a>

	<%
	if (successMessage != null) {
	%>

	<div class="success-message">
		<%=successMessage%>
	</div>

	<%
	}
	%>

	<%
	if (errorMessage != null) {
	%>

	<div class="error-message">
		<%=errorMessage%>
	</div>

	<%
	}
	%>

	<%
	if (stockError != null) {
	%>

	<div class="stock-error">
		<%=stockError%>
	</div>

	<%
	}
	%>
	<div class="product-container">

		<div class="image-section">

			<img src="<%=request.getContextPath()%>/<%=product.getImagePath()%>"
				alt="<%=product.getProductName()%>">

		</div>


		<div class="details-section">

			<h1 class="product-title">

				<%=product.getProductName()%>

			</h1>

			<div class="rating">

				<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
					class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
					class="fa-solid fa-star"></i> <span>(125 Reviews)</span>

			</div>

			<div class="price">

				&#8377;<%=product.getPrice()%>

			</div>

			<div class="stock">

				✓ In Stock (<%=product.getStockQuantity()%>
				Available)

			</div>

			<div class="description">

				<h3>Description</h3>

				<p>
					<%=product.getDescription()%>
				</p>

			</div>

			<div class="quantity">

				<label>Quantity</label>

				<div class="quantity-box">

					<button id="minusBtn">-</button>

					<input type="text" id="qty" value="1" readonly>

					<button id="plusBtn">+</button>

				</div>
				<p id="qtyError" class="qty-error"></p>

			</div>
			<div class="buttons">

				<form action="<%=request.getContextPath()%>/addToCart" method="post">

					<input type="hidden" name="productId"
						value="<%=product.getProductId()%>"> <input type="hidden"
						name="quantity" id="cartQuantity" value="1">

					<button type="submit" class="cart-btn">

						<i class="fa-solid fa-cart-shopping"></i> Add To Cart

					</button>

				</form>

				<form action="<%=request.getContextPath()%>/buyNow" method="post">

					<input type="hidden" name="productId"
						value="<%=product.getProductId()%>"> <input type="hidden"
						name="quantity" id="buyQuantity" value="1">

					<button type="submit" class="buy-btn">Buy Now</button>

				</form>

				<form action="<%=request.getContextPath()%>/addToWishlist"
					method="post">

					<input type="hidden" name="productId"
						value="<%=product.getProductId()%>">

					<button type="submit" class="wishlist-btn">

						<i class="fa-regular fa-heart"></i> Add To Wishlist

					</button>

				</form>

			</div>

		</div>

	</div>

	<!-- RELATED PRODUCTS SECTION START -->

	<section class="related-products">

		<h2>You May Also Like</h2>

		<div class="related-grid">

			<%
			if (relatedProducts != null) {

				for (Product p : relatedProducts) {
			%>

			<div class="related-card">

				<img src="<%=request.getContextPath()%>/<%=p.getImagePath()%>"
					alt="<%=p.getProductName()%>">

				<h3><%=p.getProductName()%></h3>

				<p class="related-price">
					₹<%=p.getPrice()%>
				</p>

				<a
					href="<%=request.getContextPath()%>/productDetails?productId=<%=p.getProductId()%>"
					class="related-btn"> View Product </a>

			</div>

			<%
				}
			}
			%>

		</div>

	</section>


	<script>

const maxStock = <%=maxStock%>;

const plusBtn = document.getElementById("plusBtn");
const minusBtn = document.getElementById("minusBtn");

const qty = document.getElementById("qty");

const cartQuantity =
document.getElementById("cartQuantity");

const buyQuantity =
document.getElementById("buyQuantity");

const qtyError =
document.getElementById("qtyError");

function updateQuantity(value){

    qty.value = value;

    cartQuantity.value = value;

    buyQuantity.value = value;
}

plusBtn.addEventListener("click", () => {

    let currentQty = parseInt(qty.value);

    if(currentQty < maxStock){

        updateQuantity(currentQty + 1);

        qtyError.innerHTML = "";

        if(parseInt(qty.value) >= maxStock){

            plusBtn.disabled = true;

            plusBtn.style.opacity = "0.5";

            plusBtn.style.cursor = "not-allowed";
        }

    }else{

        qtyError.innerHTML =
        "⚠ Only " + maxStock +
        " items available in stock.";
    }

});

minusBtn.addEventListener("click", () => {

    let currentQty = parseInt(qty.value);

    if(currentQty > 1){

        updateQuantity(currentQty - 1);

        qtyError.innerHTML = "";

        plusBtn.disabled = false;

        plusBtn.style.opacity = "1";

        plusBtn.style.cursor = "pointer";
    }

});

</script>
</body>
</html>