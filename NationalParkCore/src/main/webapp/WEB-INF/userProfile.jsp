<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
</head>
<body>
	<jsp:include page="nav.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-9 mx-auto">
				<div class="card mt-4">
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
										<p class="mx-4">${loggedInUser.biography}</p>
									</div>
								</div>
							</div>
						</div>
						<br>
						<button class="btn btn-warning" type="submit"
							onclick="window.location.href='goEditUserProfile.do'">
							Edit My Profile <i class="bi bi-tree-fill"></i>
						</button>
						<br>
						<jsp:include page="parkVisitsAtAGlance.jsp" />
						<br>
						<button class="btn btn-primary mx-2" type="submit"
							onclick="window.location.href='goCreateParkVisit.do'">
							Add A Park Visit <i class="bi bi-person-walking"></i>
						</button>
						<button class="btn btn-success mx-2" type="submit"
							onclick="window.location.href='listAllUserParkVisits.do'">
							View Detailed Park Visits <i class="bi bi-signpost-2-fill"></i>
						</button>
						<br> <br>
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