<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" type="image/png"
	href="images/national-parkcore-favicon.ico" />
<style>
html body {
	background-image: url('images/national-parkcore-background.jpg');
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

.top {
	margin-top: calc(100vh + var(--offset));
	text-decoration: none;
	padding: 10px;
	font-family: sans-serif;
	color: #fff;
	background: #333366;
	border-radius: 10px;
}

footer {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-7 mx-auto">
				<div class="card mt-4">
					<div>
						<div class="card-body text-center bg-light">
							<br> <br> <br>
							<form action="register.do" method="POST">
								<h3>Username</h3>
								<input type="text" name="username" required
									style="text-align: center"><br> <br>
								<h3>Password</h3>
								<input type="text" name="password" required
									style="text-align: center"><br> <br>
								<h3>First Name</h3>
								<input type="text" name="firstName" required
									style="text-align: center"><br> <br>
								<h3>Last Name</h3>
								<input type="text" name="lastName" required
									style="text-align: center"><br> <br>
								<h3>Email</h3>
								<input type="email" name="email" required
									style="text-align: center"><br> <br>
								<textarea>Biography</textarea>
								<h3>Profile Image URL</h3>
								<input type="text" name="imageURL" style="text-align: center"><br>
								<br>
								<button type="submit" class="btn btn-success">
									Create Account <i class="bi bi-tree"></i>
								</button>
							</form>
							<br> <br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
<form action="register.do" method = "POST">
<input type = "text" name = "username" required>Username
<input type = "password" name = "password" required>Password
<input type = "text" name = "firstName" required>First Name
<input type = "text" name = "lastName" required>Last Name
<input type = "email" name = "email">Email
<textarea name = "biography" >Biography</textarea>
<input type = "text" name = "imageURL">Profile Image URL
<input type = "submit" name = "Register">
</form>
</body>
</html>