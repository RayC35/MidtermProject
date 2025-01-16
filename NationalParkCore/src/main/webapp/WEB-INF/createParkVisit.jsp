<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Park Visit</title>
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
							<form action="createParkVisit.do" method="POST">
								<h2>Create A New Park Visit</h2>
								<br>
								<h3>Park Visited</h3>
								<select name="park.id" style="text-align: center;">
									<option value="1">Rocky Mountain - Colorado</option>
									<option value="2">Mesa Verde - Colorado</option>
									<option value="3">Great Sand Dunes - Colorado</option>
									<option value="4">Black Canyon of the Gunnison -
										Colorado</option>
									<option value="5">Arches - Utah</option>
									<option value="6">Bryce Canyon - Utah</option>
									<option value="7">Canyonlands - Utah</option>
									<option value="8">Capitol Reef - Utah</option>
									<option value="9">Zion - Utah</option>
								</select><br> <br>
								<h4>Title</h4>
								<input type="text" name="title" required
									style="text-align: center"><br> <br>
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
								<textarea cols="70" rows="8" style="text-align: center;"></textarea>
								<br> <br>
								<h4>Start Date</h4>
								<input type="date" name="startDate" required
									style="text-align: center"><br> <br>
								<h4>End Date</h4>
								<input type="date" name="endDate" required
									style="text-align: center"><br> <br>
								<h4>Park Visit Image URL</h4>
								<input type="text" name="imageURL" size="40"
									style="text-align: center"><br> <br>
								<button type="submit" class="btn btn-primary text-nowrap">
									Create Park Visit</button>
							</form>
							<br> <br>
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