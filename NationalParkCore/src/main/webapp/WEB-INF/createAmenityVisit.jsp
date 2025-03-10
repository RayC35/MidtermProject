<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Amenity Visit</title>
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
							<form action="createAmenityVisit.do" method="POST">
								<h2>How Was Your Visit?</h2>
								<br>
								<h4>Rating</h4>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="1"> <label class="form-check-label">★☆☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="2"> <label class="form-check-label">★★☆☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="3"> <label class="form-check-label">★★★☆☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="4"> <label class="form-check-label">★★★★☆</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="rating"
										value="5"> <label class="form-check-label">★★★★★</label>
								</div>
								<br> <br>
								<h4>Remarks</h4>
								<textarea name="remarks" cols="70" rows="8"
									style="text-align: center;"></textarea>
								<br> <br>
								<h4>Date Visited</h4>
								<input type="date" name="dateVisited" required
									style="text-align: center"><br> <br>
								<button class="btn btn-primary text-nowrap mx-2" type="submit"
									onclick="window.location.href='createAmenityVisit.do'">
									Submit Amenity Visit</button>
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