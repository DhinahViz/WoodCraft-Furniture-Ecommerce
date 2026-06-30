<%@page import="java.util.List"%>
<%@page import="com.woodcraft.model.Product"%>


<%
List<Product> products = (List<Product>) request.getAttribute("products");

String keyword = (String) request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Search Results</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/searchResults.css">

</head>

<body>

	<div class="page-container">

		<a href="<%=request.getContextPath()%>/home" class="back-btn"> <i
			class="fa-solid fa-arrow-left"></i> Back To Home

		</a>

		<h1 class="page-title">Search Results</h1>

		<p class="search-keyword">

			Results for: <strong> "<%=keyword%>"

			</strong>

		</p>

		<%
		if (products == null || products.isEmpty()) {
		%>

		<div class="empty-search">

			<i class="fa-solid fa-magnifying-glass"></i>

			<h2>No Products Found</h2>

			<p>Try another keyword.</p>

		</div>

		<%
		} else {
		%>

		<p class="product-count">

			<%=products.size()%>

			Products Found

		</p>

		<div class="product-grid">

			<%
			for (Product product : products) {
			%>

			<div class="product-card">

				<img src="<%=request.getContextPath()%>/<%=product.getImagePath()%>"
					alt="<%=product.getProductName()%>">

				<div class="product-info">

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

					<a
						href="<%=request.getContextPath()%>/productDetails?productId=<%=product.getProductId()%>&from=search"
						class="view-btn"> View Product </a>

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