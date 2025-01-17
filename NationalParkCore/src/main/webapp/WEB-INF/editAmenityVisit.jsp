<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Amenity Visit</title>
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
							<h2>Edit Your Visit to ${amenityVisit.amenity.name}</h2>
							<br>
							<form action="editAmenityVisit.do" method="POST"
								onsubmit="return window.confirm('Confirm Edits?');">
								<input type="hidden" name="id" value="${amenityVisit.id}">
								<h3>Date Visited</h3>
								<input type="date" name="dateVisited" required
									style="text-align: center" value="${amenityVisit.dateVisited}"><br>
								<br>
								<h3>Rating:</h3>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="1"
										<c:if test="${amenityVisit.rating == 1 }">Checked</c:if>><label
										class="form-check-label">★☆☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="2"
										<c:if test="${amenityVisit.rating == 2 }">Checked</c:if>><label
										class="form-check-label">★★☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="3"
										<c:if test="${amenityVisit.rating == 3 }">Checked</c:if>>
									<label class="form-check-label">★★★☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="4"
										<c:if test="${amenityVisit.rating == 4 }">Checked</c:if>>
									<label class="form-check-label">★★★★☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="5"
										<c:if test="${amenityVisit.rating == 5 }">Checked</c:if>>
									<label class="form-check-label">★★★★★</label>
								</div>
								<br> <br>
								<h3>Remarks</h3>
								<textarea name="remarks" cols="70" rows="8"
									style="text-align: center;">${amenityVisit.remarks}</textarea>
								<br> <br>
								<button type="submit" class="btn btn-warning">Submit
									Changes</button>
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