<%@page import="com.woodcraft.model.User"%>


<%
User user = (User) request.getAttribute("user");

String success = (String) session.getAttribute("profileSuccess");

session.removeAttribute("profileSuccess");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/webcontent/css/editProfile.css">

</head>

<body>

	<div class="profile-container">

		<a href="<%=request.getContextPath()%>/profile" class="back-btn">

			← Back To Profile </a>

		<%
		if (success != null) {
		%>

		<div class="success-box">

			<%=success%>

		</div>

		<%
		}
		%>

		<form action="<%=request.getContextPath()%>/editProfile" method="post">
	
			<label>Name</label> <input type="text" name="name"
				value="<%=user.getName()%>" required> <label>Email</label> <input
				type="email" name="email" value="<%=user.getEmail()%>" required>

			<label>Phone</label> <input type="text" name="phone"
				value="<%=user.getPhone()%>" required>

			<button type="submit">Update Profile</button>

		</form>

	</div>

</body>

</html>