<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Profile</title>
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
							<br>
							<h2>Edit Your Profile</h2>
							<br>
							<form action="editUserProfile.do" method="POST"
								onsubmit="return window.confirm('Confirm Edits?');">
								<img src="${loggedInUser.imageURL}"> <br> <br>
								<h3>Profile Image</h3>
								<input type="text" name="imageURL"
									value="${loggedInUser.imageURL}" size="60"
									style="text-align: center" /> <br> <br>
								<h3>First Name</h3>
								<input type="text" name="firstName"
									value="${loggedInUser.firstName}" style="text-align: center" />
								<br> <br>
								<h3>Last Name</h3>
								<input type="text" name="lastName"
									value="${loggedInUser.lastName}" style="text-align: center" />
								<br> <br>
								<h4>Email Address</h4>
								<input type="email" name="email" value="${loggedInUser.email}"
									size="30" style="text-align: center" /> <br> <br>
								<h4>Bio</h4>
								<textarea name="biography" cols="70" rows="8"
									style="text-align: center;">${loggedInUser.biography}</textarea>
								<br> <br>
								<button type="submit" class="btn btn-warning text-nowrap">
									Submit Changes</button>
								<br>
							</form>
							<br>
							<div style="text-align: center;">
								<button class="btn btn-success" type="button"
									onclick="history.back()">
									Go Back <i class="bi bi-tree"></i>
								</button>
							</div>
							<br>
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