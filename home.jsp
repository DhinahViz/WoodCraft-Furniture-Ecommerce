<%@ page import="java.util.List"%>
<%@ page import="com.woodcraft.model.Product"%>


<%@ page import="com.woodcraft.model.User"%>
<%
Integer cartCount = (Integer) request.getAttribute("cartCount");
%>

<%
User user = (User) session.getAttribute("loggedUser");
%>

<%
List<Product> products = (List<Product>) request.getAttribute("products");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WoodCraft Home</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/home.css">

</head>

<body>



	<!-- NAVBAR -->

	<header class="navbar">
		<div id="menuOverlay" class="menu-overlay"></div>
		<div class="nav-left">

			<a href="<%=request.getContextPath()%>/home" class="logo-link"> <img
				src="<%=request.getContextPath()%>/webcontent/images/logo.png"
				class="logo-img" alt="WoodCraft"> <span class="logo-text">
					WoodCraft </span>

			</a>

			<div class="menu-wrapper">

				<div class="menu-btn" id="menuBtn">
					<i class="fa-solid fa-bars"></i> Menu
				</div>

				<div class="mega-menu" id="megaMenu">

					<h3>Shop Categories</h3>

					<a href="<%=request.getContextPath()%>/roomCategory?id=1">
						Living Room </a> <a
						href="<%=request.getContextPath()%>/roomCategory?id=2">
						Bedroom </a> <a href="<%=request.getContextPath()%>/roomCategory?id=3">
						Dining Room </a> <a
						href="<%=request.getContextPath()%>/roomCategory?id=4"> Office
						Furniture </a> <a
						href="<%=request.getContextPath()%>/roomCategory?id=5">
						Outdoor Furniture </a> <a
						href="<%=request.getContextPath()%>/roomCategory?id=6"> Decor
						& Accessories </a> <a
						href="<%=request.getContextPath()%>/roomCategory?id=7"> Offers
					</a>
				</div>

			</div>

		</div>

		<form action="<%=request.getContextPath()%>/search" method="get"
			class="search-container">

			<input type="text" name="keyword"
				placeholder="Search luxury furniture..." required>

			<button type="submit">

				<i class="fa-solid fa-magnifying-glass"></i>

			</button>

		</form>

		<div class="nav-right">

			<div class="location">
				<i class="fa-solid fa-location-dot"></i> Delivery Location
			</div>

			<%
			if (user == null) {
			%>

			<div class="auth-links">

				<a href="<%=request.getContextPath()%>/login.jsp"> Login </a> <a
					href="<%=request.getContextPath()%>/index.jsp"> Register </a>

			</div>

			<%
			} else {
			%>

			<div class="profile" id="profileBtn">
				<i class="fa-solid fa-user"></i>
			</div>
			<div class="profile-dropdown" id="profileDropdown">

				<a href="#">Welcome, <%=user.getName()%></a><a
					href="<%=request.getContextPath()%>/profile"> My Profile </a> <a
					href="<%=request.getContextPath()%>/myOrders">My Orders</a> <a
					href="<%=request.getContextPath()%>/wishlist"> Wishlist </a> <a
					href="<%=request.getContextPath()%>/logout"> <i
					class="fa-solid fa-right-from-bracket"></i> Logout
				</a>


			</div>

			<a href="<%=request.getContextPath()%>/wishlist" class="wishlist">
				<i class="fa-solid fa-heart"></i>
			</a> <a href="<%=request.getContextPath()%>/viewCart" class="cart"> <i
				class="fa-solid fa-cart-shopping"></i> <span> <%=cartCount == null ? 0 : cartCount%>

			</span>

			</a>

			<%
			}
			%>

		</div>

	</header>


	<!-- HERO SECTION -->

	<section class="hero">

		<div class="slider">

			<div class="slide active">
				<img
					src="<%=request.getContextPath()%>/webcontent/images/banner1.png">
			</div>

			<div class="slide">
				<img
					src="<%=request.getContextPath()%>/webcontent/images/banner2.png">
			</div>

			<div class="slide">
				<img
					src="<%=request.getContextPath()%>/webcontent/images/adbanner1.png">
			</div>

			<div class="slide">
				<img
					src="<%=request.getContextPath()%>/webcontent/images/banner3.png">
			</div>

			<div class="slide">
				<img
					src="<%=request.getContextPath()%>/webcontent/images/banner4.png">
			</div>

		</div>

	</section>
	<section id="categories" class="categories">

		<h2>Shop By Category</h2>

		<div class="category-wrapper">

			<button class="category-nav prev-btn">
				<i class="fa-solid fa-chevron-left"></i>
			</button>

			<div class="category-slider">

				<!-- Wooden Sofas -->
				<a href="<%=request.getContextPath()%>/category?id=4"
					class="category-card"> <img
					src="<%=request.getContextPath()%>/webcontent/images/living-room.png"
					alt="Living Room">

					<h3>Living Room</h3> <!-- Wooden Beds -->
				</a> <a href="<%=request.getContextPath()%>/category?id=3"
					class="category-card"> <img
					src="<%=request.getContextPath()%>/webcontent/images/bedroom.png"
					alt="Bedroom">

					<h3>Bedroom</h3> <!-- Wooden Tables -->
				</a> <a href="<%=request.getContextPath()%>/category?id=2"
					class="category-card"> <img
					src="<%=request.getContextPath()%>/webcontent/images/dining-room.png"
					alt="Dining Room">

					<h3>Dining Room</h3>

				</a>

				<!-- Wooden Office Furniture (Using Tables Category for now) -->

				<a href="<%=request.getContextPath()%>/category?id=2"
					class="category-card"> <img
					src="<%=request.getContextPath()%>/webcontent/images/office-furniture.png"
					alt="Office Furniture">

					<h3>Office Furniture</h3>

				</a>

				<!-- Wooden Decor -->

				<a href="<%=request.getContextPath()%>/category?id=5"
					class="category-card"> <img
					src="<%=request.getContextPath()%>/webcontent/images/living-room.png"
					alt="Wooden Decor">

					<h3>Wooden Decor</h3>

				</a>

			</div>

			<button class="category-nav next-btn">
				<i class="fa-solid fa-chevron-right"></i>
			</button>

		</div>

	</section>
	<section id="featured-products" class="featured-products">

		<h2>Featured Products</h2>

		<div class="product-grid">

			<%
			if (products != null) {
				for (Product p : products) {
			%>

			<div class="product-card">

				<img src="<%=request.getContextPath()%>/<%=p.getImagePath()%>"
					alt="<%=p.getProductName()%>">

				<h3>
					<%=p.getProductName()%>
				</h3>

				<p class="price">
					&#8377;<%=p.getPrice()%>
				</p>
				<a
					href="<%=request.getContextPath()%>/productDetails?productId=<%=p.getProductId()%>&from=featured-products">
					<button>View Details</button>
				</a>

			</div>

			<%
			}
			}
			%>

		</div>
		</div>

		</div>

		<div class="view-all-container">

			<a href="<%=request.getContextPath()%>/allProducts">

				<button class="view-all-btn">View All Products</button>

			</a>

		</div>

	</section>
	</section>

	<section class="offer-banner">

		<div class="offer-content">

			<h2>Summer Furniture Sale</h2>

			<p>Get Up To 40% OFF On Premium Wooden Furniture</p>

			<button>Shop Now</button>

		</div>

	</section>

	<section class="why-choose">

		<h2>Why Choose WoodCraft</h2>

		<div class="why-grid">

			<div class="why-card">
				<i class="fa-solid fa-crown"></i>
				<h3>Premium Quality</h3>
				<p>Crafted using the finest hardwood materials.</p>
			</div>

			<div class="why-card">
				<i class="fa-solid fa-truck-fast"></i>
				<h3>Fast Delivery</h3>
				<p>Safe and quick delivery across India.</p>
			</div>

			<div class="why-card">
				<i class="fa-solid fa-shield-halved"></i>
				<h3>Warranty</h3>
				<p>Quality assurance with warranty support.</p>
			</div>

			<div class="why-card">
				<i class="fa-solid fa-credit-card"></i>
				<h3>Secure Payment</h3>
				<p>100% secure online transactions.</p>
			</div>

		</div>

	</section>

	<section class="testimonials">

		<h2>What Our Customers Say</h2>

		<div class="testimonial-grid">

			<div class="testimonial-card">

				<div class="stars">
					<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i>
				</div>

				<p>Exceptional craftsmanship and premium quality. The dining
					table exceeded my expectations.</p>

				<h4>- YogeshWaran</h4>

			</div>

			<div class="testimonial-card">

				<div class="stars">
					<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i>
				</div>

				<p>Beautiful furniture and smooth delivery. Highly recommended.
				</p>

				<h4>- Divya chandrasekar</h4>

			</div>

			<div class="testimonial-card">

				<div class="stars">
					<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
						class="fa-solid fa-star"></i>
				</div>

				<p>Elegant wooden furniture with amazing finish. Worth every
					rupee.</p>

				<h4>- Dhinakaran</h4>

			</div>

		</div>

	</section>

	<section id="newsletter" class="newsletter">



		<form action="<%=request.getContextPath()%>/subscribe" method="post"
			class="newsletter-box">

			<input type="email" name="email" placeholder="Enter your email"
				required>

			<button type="submit">Subscribe</button>

		</form>

		<%
		String subscribed = request.getParameter("subscribed");
		%>

		<%
		if ("true".equals(subscribed)) {
		%>

		<div class="subscribe-success toast-message">Successfully
			Subscribed!</div>

		<%
		} else if ("false".equals(subscribed)) {
		%>

		<div class="subscribe-error toast-message">Already Subscribed!</div>

		<%
		}
		%>

	</section>

	<footer class="footer">

		<div class="footer-grid">

			<div>

				<h3>WoodCraft</h3>

				<p>Luxury handcrafted furniture for modern living.</p>

			</div>

			<div>

				<h3>Quick Links</h3>

				<a href="<%=request.getContextPath()%>/home">Home</a> <a
					href="<%=request.getContextPath()%>/home#featured-products">
					Products </a> <a href="<%=request.getContextPath()%>/roomCategory?id=7">Offers</a>

			</div>

			<div>

				<h3>Customer Service</h3>

				<a href="<%=request.getContextPath()%>/customer/contactUs.jsp">Contact
					Us</a> <a href="<%=request.getContextPath()%>/customer/support.jsp">Support</a>

				<a href="<%=request.getContextPath()%>/customer/returns.jsp">Returns</a>
			</div>
			<div>

				<h3>Follow Us</h3>

				<div class="social-icons">

					<a href="https://www.facebook.com/profile.php?id=61577626395075"
						target="_blank"> <i class="fa-brands fa-facebook-f"></i>
					</a> <a href="https://www.instagram.com/dhina.karann/?hl=en"
						target="_blank"> <i class="fa-brands fa-instagram"></i>
					</a> <a href="https://x.com/dhinaaoff" target="_blank"> <i
						class="fa-brands fa-x-twitter"></i>
					</a>

				</div>

			</div>

		</div>

		<div class="copyright">© 2026 WoodCraft. All Rights Reserved.</div>

	</footer>


	<script>
        
	const profileBtn =
		document.getElementById("profileBtn");

		const profileDropdown =
		document.getElementById("profileDropdown");

		if(profileBtn && profileDropdown){

		    profileBtn.addEventListener("click", function(e){

		        e.stopPropagation();

		        megaMenu.classList.remove("show-menu");
		        overlay.classList.remove("show-overlay");

		        profileDropdown.classList.toggle(
		            "show-profile"
		        );

		    });

		}
		document.addEventListener("click", function(){

		    if(profileDropdown){

		        profileDropdown.classList.remove(
		            "show-profile"
		        );

		    }

		});

    </script>
	<script>

const slides = document.querySelectorAll(".slide");

let currentSlide = 0;

setInterval(() => {

    slides[currentSlide].classList.remove("active");

    currentSlide++;

    if(currentSlide >= slides.length){

        currentSlide = 0;

    }

    slides[currentSlide]
    .classList.add("active");

}, 5000);  
</script>

	<script>

const menuBtn =
document.getElementById("menuBtn");

const megaMenu =
document.getElementById("megaMenu");

const overlay =
document.getElementById("menuOverlay");

menuBtn.addEventListener("click", function(e){

    e.stopPropagation();

    if(profileDropdown){
        profileDropdown.classList.remove("show-profile");
    }

    megaMenu.classList.toggle("show-menu");

    overlay.classList.toggle("show-overlay");

});

overlay.addEventListener("click", function(){

    megaMenu.classList.remove("show-menu");

    overlay.classList.remove("show-overlay");

});

megaMenu.addEventListener("click", function(e){

    e.stopPropagation();

});

document.addEventListener("click", function(){

    if(profileDropdown){
        profileDropdown.classList.remove("show-profile");
    }

    megaMenu.classList.remove("show-menu");

    overlay.classList.remove("show-overlay");

});

megaMenu.addEventListener("click", function(e){

    e.stopPropagation();

});

if(profileDropdown){

    profileDropdown.addEventListener("click", function(e){

        e.stopPropagation();

    });

}
</script>
	<script>

const categorySlider =
document.querySelector(".category-slider");

const nextBtn =
document.querySelector(".next-btn");

const prevBtn =
document.querySelector(".prev-btn");

nextBtn.addEventListener("click", () => {

	categorySlider.scrollBy({
		left: 460,
		behavior: "smooth"
	});

});

prevBtn.addEventListener("click", () => {

	categorySlider.scrollBy({
		left: -460,
		behavior: "smooth"
	});

});
</script>

	<script>
setTimeout(() => {

    const toast =
        document.querySelector(".toast-message");

    if (toast) {

        toast.style.display = "none";
    }

}, 3000);
</script>
</body>
</html>