<%@page import="com.woodcraft.model.User"%>


<%
User user = (User) session.getAttribute("loggedUser");
%>
<%
String successMessage = (String) session.getAttribute("profileSuccess");

session.removeAttribute("profileSuccess");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/profile.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

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

	<div class="profile-container">

		<a href="<%=request.getContextPath()%>/home" class="account-title">
			My Account </a>

		<form action="<%=request.getContextPath()%>/editProfile" method="post"
			class="profile-card">

			<label>Name</label> <input type="text" name="name"
				value="<%=user.getName()%>" required> <label>Email</label> <input
				type="email" name="email" value="<%=user.getEmail()%>" required>

			<label>Phone</label> <input type="text" name="phone"
				value="<%=user.getPhone()%>" required> <label>Role</label> <input
				type="text" value="<%=user.getRole()%>" readonly>

			<button type="submit" class="update-btn">

				<i class="fa-solid fa-floppy-disk"></i> Save Changes

			</button>

		</form>

		<div class="profile-actions">

			<a href="<%=request.getContextPath()%>/myOrders"> My Orders </a> <a
				href="<%=request.getContextPath()%>/wishlist"> My Wishlist </a> <a
				href="<%=request.getContextPath()%>/logout"> Logout </a>

		</div>

	</div>

	<script>

setTimeout(() => {

    const toast =
    document.querySelector(".success-toast");

    if(toast){

        toast.style.opacity = "0";

        toast.style.transition =
        "opacity .5s";

        setTimeout(() => {

            toast.remove();

        },500);
    }

},2000);

</script>

</body>
</html>