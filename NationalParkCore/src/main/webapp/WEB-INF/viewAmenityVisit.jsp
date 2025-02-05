<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-9 mx-auto">
				<div class="card mt-2">
					<div class="card-body text-center bg-light">
						<br> <br>
						<h1>
							<a href="parkDetails.do?parkId=${amenityVisit.parkVisit.park.id}">
							${amenityVisit.parkVisit.park.name}&nbsp;National&nbsp;Park</a>
						</h1>
						<hr>
						<br>
						<h1>Visit to the ${amenityVisit.amenity.name}</h1>
						<br> <img width="50%" src="${amenityVisit.amenity.imageURL}"> <br>
						<br>
						<h2>Amenity Description:</h2>
						<div class="container">
							<div class="row">
								<div class="col-md-11 mx-auto">
									<div class="card mt-1">
										<br>
										<p class="mx-4">${amenityVisit.amenity.description}</p>
									</div>
								</div>
							</div>
						</div>
						<br>
						<h3>Cost Range:</h3>
						<c:if test="${amenityVisit.amenity.costRange == 0}">
							<p>FREE</p>
						</c:if>
						<c:if test="${amenityVisit.amenity.costRange == 1}">
							<p>$</p>
						</c:if>
						<c:if test="${amenityVisit.amenity.costRange == 2}">
							<p>$$</p>
						</c:if>
						<c:if test="${amenityVisit.amenity.costRange == 3}">
							<p>$$$</p>
						</c:if>
						<h4>Location (Click to Open In Maps):</h4>
						<h2>
							<a
								href="https://www.google.com/maps/place/${amenityVisit.amenity.latitude},${amenityVisit.amenity.longitude}"
								target="_blank">${amenityVisit.amenity.latitude},
								${amenityVisit.amenity.longitude}</a>
						</h2>
						<br>
						<h4>Amenity Website:</h4>
						<p>
							<a href="${amenityVisit.amenity.websiteURL}" target="_blank">${amenityVisit.amenity.name}
								Website</a>
						</p>
						<hr>
						<br>
						<h3>Amenity Visited:</h3>
						<h4>
							<fmt:parseDate value="${amenityVisit.dateVisited}"
								pattern="yyyy-MM-dd" var="parsedDate" type="date" />
							<fmt:formatDate value="${parsedDate}" var="newParsedDate"
								type="date" pattern="MMM d, yyyy" />${newParsedDate}</h4>
						<br>
						<hr>
						<br>
						<h3>Author:&nbsp;</h3>
						<h4>${amenityVisit.parkVisit.user.username}</h4>
						<br>
						<h3>Rating:</h3>
						<h1>
							<c:if test="${amenityVisit.rating == 1}">
								<p style="color: orange;">★☆☆☆☆</p>
							</c:if>
							<c:if test="${amenityVisit.rating == 2}">
								<p style="color: orange;">★★☆☆☆</p>
							</c:if>
							<c:if test="${amenityVisit.rating == 3}">
								<p style="color: orange;">★★★☆☆</p>
							</c:if>
							<c:if test="${amenityVisit.rating == 4}">
								<p style="color: orange;">★★★★☆</p>
							</c:if>
							<c:if test="${amenityVisit.rating == 5}">
								<p style="color: orange;">★★★★★</p>
							</c:if>
						</h1>
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
						<p>
							Last Updated:
							<fmt:parseDate value="${amenityVisit.lastUpdate}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}"
								pattern="MMM d, yyyy hh:mm a" />
						</p>
						<hr>
						<br>
						<c:if test="${loggedInUser.id == amenityVisit.parkVisit.user.id}">
						<button class="btn btn-primary text-nowrap mx-2" type="submit"
									onclick="window.location.href='goCreateAmenityVisit?amenityVisitId=${amenityVisit.id}.do'">
									Create New Amenity Visit</button>
							<button class="btn btn-primary mx-2" type="submit"
								onclick="window.location.href='goEditAmenityVisit.do?amenityVisitId=${amenityVisit.id}'">
								Edit Amenity Visit <i class="bi bi-person-walking"></i>
							</button>
						</c:if>
						<button class="btn btn-success mx-2" type="submit"
							onclick="history.back()">
							Go Back <i class="bi bi-tree"></i>
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
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>