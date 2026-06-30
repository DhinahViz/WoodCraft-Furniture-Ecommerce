<%@ page import="java.util.List"%>
<%@ page import="com.woodcraft.model.Product"%>

<%
List<Product> products =
(List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>All Products</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/home.css">

<style>
.products-page {
	padding: 50px;
}

.products-page h2 {
	text-align: center;
	margin-bottom: 40px;
}

.product-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 25px;
}

.product-card {
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .08);
	text-align: center;
}

.product-card img {
	width: 100%;
	height: 250px;
	object-fit: cover;
}

.product-card h3 {
	margin: 15px 0;
}

.price {
	font-weight: bold;
	color: #8B5E3C;
}

.product-card button {
	margin: 15px;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

.back-btn {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	margin: 20px 0 30px 20px;
	padding: 12px 20px;
	background: #6b4f3b;
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: 600;
}

.back-btn:hover {
	background: #4b2e1e;
	transform: translateY(-2px);
}

.search-box {
	text-align: center;
	margin-bottom: 30px;
}

.search-box input {
	width: 400px;
	max-width: 90%;
	padding: 12px 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
}
</style>

</head>

<body>

	<a href="javascript:history.back();" class="back-btn"> <i
		class="fa-solid fa-arrow-left"></i> Back

	</a>

	<section class="products-page">

		<h2>All Products</h2>
		
		<div class="search-box">
    <input type="text"
           id="productSearch"
           placeholder="Search products..."
           onkeyup="searchProducts()">
</div>

<div id="noProductsMessage" style="display:none; text-align:center; margin:30px 0; font-size:20px; color:#6b4f3b; font-weight:600;">
    No Products Found
</div>

		<div class="product-grid">

			<%
for(Product p : products){
%>

			<div class="product-card">

				<img src="<%=request.getContextPath()%>/<%=p.getImagePath()%>">

				<h3 class="product-name"><%=p.getProductName()%></h3>

				<p class="price">
					&#8377;<%=p.getPrice()%>
				</p>

				<a
					href="<%=request.getContextPath()%>/productDetails?productId=<%=p.getProductId()%>">

					<button>View Details</button>

				</a>

			</div>

			<%
}
%>

		</div>

	</section>
	<script>
function searchProducts() {

	let input = document.getElementById("productSearch")
			.value.toLowerCase();

	let cards = document.querySelectorAll(".product-card");

	let visibleCount = 0;

	cards.forEach(card => {

		let name = card.querySelector(".product-name")
				.textContent.toLowerCase();

		if (name.includes(input)) {

			card.style.display = "block";
			visibleCount++;

		} else {

			card.style.display = "none";
		}
	});

	let message =
		document.getElementById("noProductsMessage");

	if (visibleCount === 0) {
		message.style.display = "block";
	} else {
		message.style.display = "none";
	}
}
</script>

</body>
</html>