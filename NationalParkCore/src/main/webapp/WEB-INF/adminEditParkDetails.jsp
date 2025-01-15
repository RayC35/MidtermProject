<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Park Details</title>
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
							<h2>Edit ${adminFoundPark.name} National Park</h2>
							<br>
							<form action="adminEditParkDetails.do" method="POST"
								onsubmit="return window.confirm('Confirm Edits?');">
								<img src="${adminFoundPark.imageURL}"> <br> <br>
								<h3>Image URL</h3>
								<input type="text" name="imageURL"
									value="${adminFoundPark.imageURL}" size="60"
									style="text-align: center" /> <br> <br>
								<h3>Name</h3>
								<input type="text" name="name" value="${adminFoundPark.name}"
									style="text-align: center" />
								<h3>Description</h3>
								<input type="text" name="description"
									value="${adminFoundPark.description}" size="70"
									style="text-align: center" /> <br> <br>
								<h3>Main Entrance Latitude</h3>
								<input type="text" name="mainEntranceLongitude"
									value="${adminFoundPark.mainEntranceLatitude}"
									style="text-align: center" /> <br> <br>
								<h3>Main Entrance Longitude</h3>
								<input type="text" name="mainEntranceLongitude"
									value="${adminFoundPark.mainEntranceLongitude}"
									style="text-align: center" /> <br> <br>
								<h3>State Abbreviation</h3>
								<input type="text" name="stateAbbreviation"
									value="${adminFoundPark.stateAbbreviation}"
									style="text-align: center" /> <br> <br>
								<h3>Opening Time</h3>
								<input type="time" name="openingTime"
									value="${adminFoundPark.openingTime}"
									style="text-align: center" /> <br> <br>
								<h3>Closing Time</h3>
								<input type="time" name="closingTime"
									value="${adminFoundPark.closingTime}"
									style="text-align: center" /> <br> <br>
								<h3>Entry Fee</h3>
								<input type="number" name="entryFee"
									value="${adminFoundPark.entryFee}" style="text-align: center" />
								<br> <br>
								<h3>Website URL</h3>
								<input type="text" name="websiteURL"
									value="${adminFoundPark.websiteURL}" size="60"
									style="text-align: center" /> <br> <br>
								<button type="submit" class="btn btn-success text-nowrap">
									Submit Changes</button>
							</form>
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