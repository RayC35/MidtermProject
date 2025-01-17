<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register New Account</title>
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
							<br> <br>
							<form action="register.do" method="POST"
								onsubmit="return window.confirm('Confirm Submission?');">
								<h2>Register a New Account</h2>
								<br>
								<h4>Username</h4>
								<input type="text" name="username" required
									style="text-align: center"><br> <br>
								<h4>Password</h4>
								<input type="text" name="password" required
									style="text-align: center"><br> <br>
								<h4>First Name</h4>
								<input type="text" name="firstName" required
									style="text-align: center"><br> <br>
								<h4>Last Name</h4>
								<input type="text" name="lastName" required
									style="text-align: center"><br> <br>
								<h4>Email Address</h4>
								<input type="email" name="email" required size="30"
									style="text-align: center"><br> <br>
								<h4>Biography</h4>
								<textarea name="biography" cols="70" rows="8"></textarea>
								<br> <br>
								<h4>Profile Image URL</h4>
								<input type="text" name="imageURL" size="60"
									style="text-align: center"><br> <br>
								<button type="submit" class="btn btn-warning">Create
									Account</button>
							</form>
							<br>
							<div style="text-align: center;">
								<button class="btn btn-success" type="button"
									onclick="history.back()">
									Go Back <i class="bi bi-tree"></i>
								</button>
							</div>
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
</body>
</html>