<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin View User Profile</title>
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
							<h2>${adminFoundUser.firstName}&nbsp;${adminFoundUser.lastName}</h2>
							<img src="${adminFoundUser.imageURL}"> <br> <br>
							<h4>Enabled:</h4>
							<p>${adminFoundUser.enabled}</p>
							<h4>Role:</h4>
							<p>${adminFoundUser.role}</p>
							<h4>First Name:</h4>
							<p>${adminFoundUser.firstName}</p>
							<h4>Last Name:</h4>
							<p>${adminFoundUser.lastName}</p>
							<h4>Create Date:</h4>
							<p>${adminFoundUser.createDate}</p>
							<h4>Last Update:</h4>
							<p>${adminFoundUser.lastUpdate}</p>
							<h4>Email:</h4>
							<p>${adminFoundUser.email}</p>
							<h4>Bio:</h4>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<p>${adminFoundUser.biography}</p>
										</div>
									</div>
								</div>
							</div>
							<br>
							<button class="btn btn-warning text-nowrap" type="submit"
								onclick="window.location.href='goAdminEditUserProfile.do?userId=${adminFoundUser.id}'">
								Edit ${adminFoundUser.username}'s Profile <i
									class="bi bi-signpost-2"></i>
							</button>
							<button class="btn btn-success mx-2" type="submit"
								onclick="history.back()">
								Go Back <i class="bi bi-signpost-2-fill"></i>
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