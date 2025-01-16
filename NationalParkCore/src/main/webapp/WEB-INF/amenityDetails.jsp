<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amenity Details</title>
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
	<div class="container" style="text-align: center;">
		<div class="row">
			<div class="col-md-9 mx-auto">
				<div class="card mt-4">
					<div class="card-body text-center bg-light">
						<h2>${amenity.name}</h2>
						<br> <img class="amenityImage" width="50%"
							src="${amenity.imageURL}"> <br>
						<h3>Amenity Description:</h3>
						<div class="container">
							<div class="row">
								<div class="col-md-11 mx-auto">
									<div class="card mt-1">
										<br>
										<p class="mx-4">${amenity.description}</p>
									</div>
								</div>
							</div>
						</div>
						<br>
						<h4>Cost Range:</h4>
						<c:if test="${amenity.costRange == 0}">
							<p>FREE</p>
						</c:if>
						<c:if test="${amenity.costRange == 1}">
							<p>$</p>
						</c:if>
						<c:if test="${amenity.costRange == 2}">
							<p>$$</p>
						</c:if>
						<c:if test="${amenity.costRange == 3}">
							<p>$$$</p>
						</c:if>
						<p>
							<a href="${amenity.websiteURL}" target="_blank">Official
								Amenity Website</a>
						</p>
						<button class="btn btn-success mx-2" type="submit"
							onclick="window.location.href='listAmenityVisitsByAmenity.do?amenity=${amenity.id}'">
							View Amenity Visits <i class="bi bi-signpost-2-fill"></i>
						</button>
						<button class="btn btn-success" type="button"
							onclick="history.back()">
							Go Back <i class="bi bi-tree"></i>
						</button>
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