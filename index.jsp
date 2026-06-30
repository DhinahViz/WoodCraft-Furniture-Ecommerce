<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Register | WoodCraft Luxury</title>

<link rel="stylesheet" href="webcontent/css/register.css">

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

				<h1>Crafted For Timeless Living</h1>

				<p>Premium handcrafted wooden furniture designed for elegant
					homes.</p>

			</div>

		</div>

		<div class="right-panel">

			<div class="register-card">

				<h2>WoodCraft Luxury</h2>

				<p class="subtitle">Create Your Account</p>

				<form action="register" method="post">

					<input type="text" name="name" placeholder="Full Name" required>

					<input type="email" name="email" placeholder="Email Address"
						required> <input type="text" name="phone"
						placeholder="Phone Number" required> <input
						type="password" name="password" placeholder="Password" required>

					<input type="password" id="confirmPassword"
						placeholder="Confirm Password" required>

					<button type="submit">Create Account</button>

				</form>

				<p class="login-link">

					Already have an account? <a href="login.jsp"> Login </a>

				</p>

			</div>

		</div>

	</div>

	<script>
		document
				.querySelector("form")
				.addEventListener(
						"submit",
						function(e) {

							let password = document
									.querySelector('input[name="password"]').value;

							let confirm = document
									.querySelector("#confirmPassword").value;

							if (password !== confirm) {

								alert("Passwords do not match");

								e.preventDefault();
							}
						});
	</script>

</body>
</html>