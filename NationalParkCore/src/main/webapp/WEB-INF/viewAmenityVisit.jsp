<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Amenity Visit</title>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12 mx-auto">
				<div class="card mt-2">
					<div class="card-body">
						<div class="container">
							<div class="row">
								<div class="col-sm"></div>
								<br> <br>
								<h1>${amenity.name}Visit</h1>
								<p>Posted On: ${amenityVisit.createDate}</p>
								<br> <img src="${amenity.imageURL}"> <br> <br>
								<p>${amenity.description}</p>
								<br>
								<h2>${amenity.costRange}</h2>
								<br>
								<h4>Location (Click to Open In Maps):</h4>
								<h2>
									<a
										href="https://www.google.com/maps/place/${amenity.latitude},${amenity.longitude}"
										target="_blank">${amenity.latitude}, ${amenity.longitude}</a>
								</h2>
								<br>
								<hr>
								<br>
								<h2>Date Visited: ${amenityVisit.dateVisited}</h2>
								<br>
								<h2>Rating: ${amenityVisit.rating}</h2>
								<div class="container">
									<div class="row">
										<div class="col-md-11 mx-auto">
											<div class="card mt-1">
												<br>
												<p class="mx-4">${amenityVisit.remarks}</p>
											</div>
										</div>
									</div>
								</div>
								<p>Last Updated: ${amenityVisit.lastUpdate}</p>
								<br>
								<h4>Amenity Website:</h4>
								<p>
									<a href="${amenity.websiteURL}" target="_blank">${amenity.name}
										Website</a>
								</p>
								<br> <br>
								<hr>
								<br> <br>
								<c:if test="${loggedInUser.id == amenityVisit.user.id}">
									<button class="btn btn-primary mx-2" type="submit"
										onclick="window.location.href='goEditParkVisit.do'">
										Edit Amenity Visit <i class="bi bi-person-walking"></i>
									</button>
								</c:if>
								<button class="btn btn-success mx-2" type="submit"
									onclick="window.location.href='listAllUserAmenityVisits.do?userId=${loggedInUser.id}'">
									Back To Amenity Visits <i class="bi bi-signpost-2-fill"></i>
								</button>
								<button class="btn btn-warning text-nowrap mx-2" type="submit"
									onclick="window.location.href='goUserProfile.do'">
									My Account <i class="bi bi-tree-fill"></i>
								</button>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
	</div>
	<jsp:include page="footer.jsp" />
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>