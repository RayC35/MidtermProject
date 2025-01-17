<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Park Visit</title>
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
							<h2>Edit Your Park Visit</h2>
							<br>
							<form action="editParkVisitDetails.do" method="POST"
								onsubmit="return window.confirm('Confirm Edits?');">
								<h3>Park Visited</h3>
								<select name="park.id" style="text-align: center;">
									<option value="1"
										<c:if test="${parkVisit.park.id == 1 }">selected</c:if>>Rocky
										Mountain - Colorado</option>
									<option value="2"
										<c:if test="${parkVisit.park.id == 2 }">selected</c:if>>Mesa
										Verde - Colorado</option>
									<option value="3"
										<c:if test="${parkVisit.park.id == 3 }">selected</c:if>>Great
										Sand Dunes - Colorado</option>
									<option value="4"
										<c:if test="${parkVisit.park.id == 4 }">selected</c:if>>Black
										Canyon of the Gunnison - Colorado</option>
									<option value="5"
										<c:if test="${parkVisit.park.id == 5 }">selected</c:if>>Arches
										- Utah</option>
									<option value="6"
										<c:if test="${parkVisit.park.id == 6 }">selected</c:if>>Bryce
										Canyon - Utah</option>
									<option value="7"
										<c:if test="${parkVisit.park.id == 7 }">selected</c:if>>Canyonlands
										- Utah</option>
									<option value="8"
										<c:if test="${parkVisit.park.id == 8 }">selected</c:if>>Capitol
										Reef - Utah</option>
									<option value="9"
										<c:if test="${parkVisit.park.id == 9 }">selected</c:if>>Zion
										- Utah</option>
								</select><br> <br>
								<h4>Title</h4>
								<input type="text" name="title" value="${parkVisit.title}"
									required style="text-align: center"><br> <br>
								<h4>Rating</h4>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="1"
										<c:if test="${parkVisit.rating == 1 }">Checked</c:if>>
									<label class="form-check-label">★☆☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="2"
										<c:if test="${parkVisit.rating == 2 }">Checked</c:if>>
									<label class="form-check-label">★★☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="3"
										<c:if test="${parkVisit.rating == 3 }">Checked</c:if>>
									<label class="form-check-label">★★★☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="4"
										<c:if test="${parkVisit.rating == 4 }">Checked</c:if>>
									<label class="form-check-label">★★★★☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="5"
										<c:if test="${parkVisit.rating == 5 }">Checked</c:if>>
									<label class="form-check-label">★★★★★</label>
								</div>
								<br> <br>
								<h4>Remarks</h4>
								<textarea name="remarks" cols="70" rows="8"
									style="text-align: center;">${parkVisit.remarks}</textarea>
								<br> <br>
								<h4>Start Date</h4>
								<input type="date" name="startDate"
									value="${parkVisit.startDate}" required
									style="text-align: center"><br> <br>
								<h4>End Date</h4>
								<input type="date" name="endDate" value="${parkVisit.endDate}"
									required style="text-align: center"><br> <br>
								<h4>Park Visit Image URLs</h4>
								<c:forEach var="visitImage" items="${parkVisitImages}">
									<img class="parkVisitImage" width="50%"
										src="${visitImage.imageURL}">${visitImage.description} 
								<input type="text" name="imageURL" size="40"
										value="${visitImage.imageURL}" style="text-align: center">
								</c:forEach>
								<br> <br>
								<button type="submit" class="btn btn-primary text-nowrap">
									Submit Changes</button>
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