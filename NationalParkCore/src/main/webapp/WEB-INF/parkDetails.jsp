<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park Details</title>
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
					<div class="card-body" style="text-align: center">
						<br> <br>
						<h1>Welcome to ${park.name} National Park!</h1>
						<br> <img src="${park.imageURL}"> <br> <br>
						<h2>${park.name}&nbsp;-&nbsp;${park.stateAbbreviation}</h2>
						<p>${park.description}</p>
						<h4>Location (Click to Open In Maps):</h4>
						<h2>
							<a
								href="https://www.google.com/maps/place/${park.mainEntranceLatitude},${park.mainEntranceLongitude}"
								target="_blank">${park.mainEntranceLatitude},
								${park.mainEntranceLongitude}</a>
						</h2>
						<h4>Open hours:</h4>
						<p>${park.openingTime}-${park.closingTime}</p>
						<h4>Entry Fee:</h4>
						<p>$${park.entryFee}0</p>
						<h4>Park Website:</h4>
						<p>
							<a href="${park.websiteURL}" target="_blank">${park.name}
								Website</a>
						</p>
						<hr>
						<c:if test="${user.role == 'admin'}">
							<button class="btn btn-warning text-nowrap" type="submit"
								onclick="window.location.href='goAdminEditParkDetails.do?parkId=${park.id}'">
								Edit Park <i class="bi bi-tree-fill"></i>
							</button>
						</c:if>
						<br>
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