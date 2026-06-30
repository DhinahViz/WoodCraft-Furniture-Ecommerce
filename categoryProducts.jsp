<%@page import="java.util.List"%>
<%@page import="com.woodcraft.model.Product"%>


<%
List<Product> products = (List<Product>) request.getAttribute("products");
String categoryName = (String) request.getAttribute("categoryName");
String successMessage = (String) session.getAttribute("successMessage");
session.removeAttribute("successMessage");
int productCount = (Integer) request.getAttribute("productCount");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Category Products</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/categoryProducts.css">

</head>

<body>
<body>

	<%
	if (successMessage != null) {
	%>

	<div class="success-toast">

		<i class="fa-solid fa-circle-check"></i>

		<%=successMessage%>

	</div>

	<%
	}
	%>

	<div class="page-container">
		<h1 class="page-title">
			<a href="<%=request.getContextPath()%>/home#categories"
				class="category-back-link"> <%=categoryName%>
			</a>

		</h1>
		<p class="product-count">

			<%=productCount%>
			Products Found

		</p>

		<div class="products-toolbar">

			<div class="search-box">

				<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
					id="productSearch" placeholder="Search furniture...">

			</div>

			<div class="sort-box">

				<select id="sortProducts">

					<option value="default">Featured</option>

					<option value="low-high">Price Low To High</option>

					<option value="high-low">Price High To Low</option>

					<option value="name">Name A-Z</option>

				</select>

			</div>

		</div>

		<div class="products-layout">

			<aside class="filter-sidebar">

				<h3>Filters</h3>

				<div class="filter-section">

					<h4>Availability</h4>

					<label> <input type="checkbox" class="stock-filter"
						value="instock"> In Stock
					</label> <label> <input type="checkbox" class="stock-filter"
						value="outofstock"> Out Of Stock
					</label>

					<h4>Price Range</h4>

					<label> <input type="checkbox" class="price-filter"
						value="0-10000"> Under &#8377;10,000
					</label> <label> <input type="checkbox" class="price-filter"
						value="10000-25000"> &#8377;10,000 - &#8377;25,000
					</label> <label> <input type="checkbox" class="price-filter"
						value="25000-50000"> &#8377;25,000 - &#8377;50,000
					</label> <label> <input type="checkbox" class="price-filter"
						value="50000-above"> Above &#8377;50,000

					</label>

				</div>

			</aside>

			<div class="product-grid" id="productGrid">

				<div id="noProductsMessage" class="no-products">

					<i class="fa-solid fa-box-open"></i>

					<h2>No Products Found</h2>

					<p>Try changing your filters or search keyword.</p>

				</div>

				<%
				if (products != null) {

					for (Product product : products) {
				%>

				<div class="product-card"
					data-name="<%=product.getProductName().toLowerCase()%>"
					data-price="<%=product.getPrice()%>"
					data-stock="<%=product.getStockQuantity()%>">


					<img
						src="<%=request.getContextPath()%>/<%=product.getImagePath()%>"
						alt="<%=product.getProductName()%>">

					<div class="product-info">

						<div class="rating-badge">

							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i> <span>4.8</span>

						</div>

						<h3>
							<%=product.getProductName()%>
						</h3>

						<p class="price">
							&#8377;<%=product.getPrice()%>
						</p>
						<!-- STOCK STATUS -->

						<p
							class="stock-status
    <%=product.getStockQuantity() > 0 ? "in-stock" : "out-stock"%>">

							<%=product.getStockQuantity() > 0
		? "<i class='fa-solid fa-circle-check'></i> In Stock"
		: "<i class='fa-solid fa-circle-xmark'></i> Out Of Stock"%>

						</p>

						<div class="product-actions">

							<form action="<%=request.getContextPath()%>/addToWishlist"
								method="post">

								<input type="hidden" name="productId"
									value="<%=product.getProductId()%>">

								<button type="submit" class="wishlist-btn">

									<i class="fa-regular fa-heart"></i> Wishlist

								</button>

							</form>

							<button class="quick-view-btn">

								<i class="fa-solid fa-eye"></i> Quick View

							</button>

							<a
								href="<%=request.getContextPath()%>/productDetails?productId=<%=product.getProductId()%>"
								class="view-btn"> View Product </a>

						</div>

					</div>
				</div>
				<%
				}
				}
				%>

			</div>

		</div>

		<script>

/* =========================
   ELEMENTS
========================= */

const searchInput =
document.getElementById("productSearch");

const sortSelect =
document.getElementById("sortProducts");

const productGrid =
document.getElementById("productGrid");

const priceFilters =
document.querySelectorAll(".price-filter");

const stockFilters =
document.querySelectorAll(".stock-filter");

const noProducts =
document.getElementById("noProductsMessage");

/* =========================
   EVENTS
========================= */

searchInput.addEventListener(
    "keyup",
    applyAllFilters
);

priceFilters.forEach(filter => {

    filter.addEventListener(
        "change",
        applyAllFilters
    );

});

stockFilters.forEach(filter => {

    filter.addEventListener(
        "change",
        applyAllFilters
    );

});

sortSelect.addEventListener(
    "change",
    sortProducts
);

/* =========================
   FILTERS
========================= */

function applyAllFilters(){

    const searchValue =
    searchInput.value.toLowerCase();

    const checkedPrices =
    Array.from(priceFilters)
    .filter(cb => cb.checked)
    .map(cb => cb.value);

    const checkedStock =
    Array.from(stockFilters)
    .filter(cb => cb.checked)
    .map(cb => cb.value);

    let visibleCount = 0;

    document
    .querySelectorAll(".product-card")
    .forEach(card => {

        const productName =
        card.dataset.name;

        const price =
        parseFloat(card.dataset.price);

        const stock =
        parseInt(card.dataset.stock);

        let show = true;

        /* SEARCH */

        if(
            searchValue &&
            !productName.includes(searchValue)
        ){
            show = false;
        }

        /* PRICE FILTER */

        if(show && checkedPrices.length > 0){

            let priceMatch = false;

            checkedPrices.forEach(range => {

                if(
                    range === "0-10000" &&
                    price < 10000
                ){
                    priceMatch = true;
                }

                if(
                    range === "10000-25000" &&
                    price >= 10000 &&
                    price <= 25000
                ){
                    priceMatch = true;
                }

                if(
                    range === "25000-50000" &&
                    price > 25000 &&
                    price <= 50000
                ){
                    priceMatch = true;
                }

                if(
                    range === "50000-above" &&
                    price > 50000
                ){
                    priceMatch = true;
                }

            });

            if(!priceMatch){
                show = false;
            }
        }

        /* STOCK FILTER */

        if(show && checkedStock.length > 0){

            let stockMatch = false;

            checkedStock.forEach(type => {

                if(
                    type === "instock" &&
                    stock > 0
                ){
                    stockMatch = true;
                }

                if(
                    type === "outofstock" &&
                    stock <= 0
                ){
                    stockMatch = true;
                }

            });

            if(!stockMatch){
                show = false;
            }
        }

        card.style.display =
        show ? "block" : "none";

        if(show){
            visibleCount++;
        }

    });

    /* NO PRODUCTS MESSAGE */

    if(visibleCount === 0){

        noProducts.style.display =
        "block";

    }else{

        noProducts.style.display =
        "none";

    }

}

/* =========================
   SORT PRODUCTS
========================= */

function sortProducts(){

    const cards =
    Array.from(
        document.querySelectorAll(
            ".product-card"
        )
    );

    const selected =
    sortSelect.value;

    cards.sort((a,b)=>{

        if(selected === "low-high"){

            return parseFloat(
                a.dataset.price
            ) -
            parseFloat(
                b.dataset.price
            );

        }

        if(selected === "high-low"){

            return parseFloat(
                b.dataset.price
            ) -
            parseFloat(
                a.dataset.price
            );

        }

        if(selected === "name"){

            return a.dataset.name
            .localeCompare(
                b.dataset.name
            );

        }

        return 0;

    });

    cards.forEach(card => {

        productGrid.appendChild(card);

    });

}

</script>

		<script>
setTimeout(() => {

    const toast =
    document.querySelector(".success-toast");

    if(toast){

        toast.style.opacity = "0";

        setTimeout(() => {

            toast.remove();

        },500);
    }

},3000);
</script>

	</div>

</body>

</html>