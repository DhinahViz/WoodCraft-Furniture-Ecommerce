<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login | WoodCraft Luxury</title>

<link rel="stylesheet" href="webcontent/css/login.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Playfair+Display:wght@600;700&display=swap"
	rel="stylesheet">

</head>

<body>

	<div class="container">

		<div class="left-panel">

			<div class="overlay">

				<h1>Welcome Back</h1>

				<p>Discover handcrafted wooden furniture designed for elegant
					living.</p>

			</div>

		</div>

		<div class="right-panel">

			<div class="login-card">

				<h2>WoodCraft Luxury</h2>

				<p class="subtitle">Sign In To Your Account</p>

				<form action="login" method="post">

					<input type="email" name="email" placeholder="Email Address"
						required> <input type="password" name="password"
						placeholder="Password" required>

					<div class="options">

						<label> <input type="checkbox"> Remember Me

						</label> <a href="#"> Forgot Password? </a>

					</div>

					<button type="submit">Login</button>

				</form>

				<p class="register-link">

					New Customer? <a href="index.jsp"> Create Account </a>

				</p>

			</div>

		</div>

	</div>

</body>
</html>