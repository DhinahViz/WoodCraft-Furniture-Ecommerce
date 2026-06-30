<%@page import="java.util.List"%>
<%@page import="com.woodcraft.model.Product"%>

<%
List<Product> wishlistProducts = (List<Product>) request.getAttribute("wishlistProducts");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Wishlist</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/wishlist.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

	<a href="<%=request.getContextPath()%>/home" class="back-btn"> <i
		class="fa-solid fa-arrow-left"></i> Back To Home

	</a>

	<div class="wishlist-container">

		<h1 class="wishlist-title">My Wishlist &#10084;&#65039;</h1>

		<p class="wishlist-count">

			<%=wishlistProducts != null ? wishlistProducts.size() : 0%>

			Items Saved

		</p>

		<%
		if (wishlistProducts == null || wishlistProducts.isEmpty()) {
		%>

		<div class="empty-wishlist">

			<i class="fa-regular fa-heart"></i>

			<h2>Your Wishlist Is Empty</h2>

			<p>Save your favorite furniture products here.</p>

			<a href="<%=request.getContextPath()%>/home" class="continue-btn">

				Continue Shopping </a>

		</div>

		<%
		} else {
		%>

		<div class="wishlist-grid">

			<%
			for (Product product : wishlistProducts) {
			%>

			<div class="wishlist-card">

				<img src="<%=request.getContextPath()%>/<%=product.getImagePath()%>"
					alt="<%=product.getProductName()%>">

				<div class="wishlist-info">

					<h3>
						<%=product.getProductName()%>
					</h3>

					<p class="price">
						&#8377;<%=product.getPrice()%>
					</p>

					<p class="stock">

						<%
						if (product.getStockQuantity() > 0) {
						%>
						<span class="in-stock">&#10004; In Stock</span>
						<%
						} else {
						%>
						<span class="out-stock">&#10008; Out Of Stock</span>
						<%
						}
						%>

					</p>

					<div class="wishlist-actions">

						<a
							href="<%=request.getContextPath()%>/productDetails?productId=<%=product.getProductId()%>"
							class="view-btn"> View Product </a>

					</div>

				</div>

			</div>

			<%
			}
			%>

		</div>

		<%
		}
		%>

	</div>

</body>

</html>