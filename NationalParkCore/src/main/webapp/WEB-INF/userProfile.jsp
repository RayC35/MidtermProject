<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account</title>
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
							<br> <br>
							<h2>${loggedInUser.firstName}&nbsp;${loggedInUser.lastName}</h2>
							<img src="${loggedInUser.imageURL}"> <br> <br>
							<h4>Username:</h4>
							<p>${loggedInUser.username}</p>
							<h4>Email Address:</h4>
							<p>${loggedInUser.email}</p>
							<h4>Bio:</h4>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<p>${loggedInUser.biography}</p>
										</div>
									</div>
								</div>
							</div>
							<br>
							<button class="btn btn-warning" type="submit"
								onclick="window.location.href='goEditUserProfile.do'">
								Edit My Profile <i class="bi bi-signpost-2"></i>
							</button>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>