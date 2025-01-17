<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park Visit Details</title>
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
					<div>
						<div class="card-body text-center bg-light">
							<br> <br>
							<h1>${parkVisit.park.name}NationalPark</h1>
							<hr>
							<br>
							<h2>${parkVisit.title}</h2>
							<p>
								<strong>Posted On: </strong>${parkVisit.createDate}</p>
							<c:forEach var="visitImage" items="${parkVisitImages}">
								<img class="parkVisitImage" width="50%"
									src="${visitImage.imageURL}">${visitImage.description} </c:forEach>
							<br> <br>
							<h3>Park Visited:</h3>
							<h4>${parkVisit.startDate}-${parkVisit.endDate}</h4>
							<br>
							<hr>
							<br>
							<h3>Author:&nbsp;</h3>
							<h4>${parkVisit.user.username}</h4>
							<br>
							<h3>Rating:</h3>
							<h1>
								<c:if test="${parkVisit.rating == 1}">
									<p style="color: orange;">★☆☆☆☆</p>
								</c:if>
								<c:if test="${parkVisit.rating == 2}">
									<p style="color: orange;">★★☆☆☆</p>
								</c:if>
								<c:if test="${parkVisit.rating == 3}">
									<p style="color: orange;">★★★☆☆</p>
								</c:if>
								<c:if test="${parkVisit.rating == 4}">
									<p style="color: orange;">★★★★☆</p>
								</c:if>
								<c:if test="${parkVisit.rating == 5}">
									<p style="color: orange;">★★★★★</p>
								</c:if>
							</h1>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<p class="mx-4">${parkVisit.remarks}</p>
										</div>
									</div>
								</div>
							</div>
							<p>Last Updated: ${parkVisit.lastUpdate}</p>
							<br>
							<c:if test="${loggedInUser.id == parkVisit.user.id}">
								<button class="btn btn-primary mx-2" type="submit"
									onclick="window.location.href='goEditParkVisitDetails.do?parkVisitId=${parkVisit.id}'">
									Edit Park Visit <i class="bi bi-person-walking"></i>
								</button>
							</c:if>
							<button class="btn btn-success mx-2" type="submit"
								onclick="history.back()">
								Go Back <i class="bi bi-tree"></i>
							</button>
							<br> <br>
							<hr>
							<br>
							<h3>Park Amenity Visits</h3>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<c:forEach var="visitRemarks" items="${parkVisitRemarks}">
												<p class="mx-4">${amenityVisit.remarks}</p>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<br>
							<button class="btn btn-primary mx-2" type="submit"
								onclick="window.location.href='goCreateAmenityVisit.do'">
								Add An Amenity Visit <i class="bi bi-person-walking"></i>
							</button>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>