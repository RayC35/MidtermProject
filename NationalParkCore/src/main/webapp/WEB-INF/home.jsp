<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National ParkCore</title>
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
								<div class="col-sm">
									<div class="col-sm" style="text-align: center">
										<h5 style="text-align: center">Check Out Zion's
											Activities</h5>
										<br> <img class="image" src="images/zion-square.jpg">
										<br>
										<button class="btn btn-success text-nowrap mx-2" type="submit"
											onclick="window.location.href='goParkDetails.do?parkId=9'">
											Check Them Out!</button>
										<br>
									</div>
								</div>
								<div class="col-sm" style="text-align: center">
									<h5 style="text-align: center">Food at Rocky Mountain</h5>
									<br> <img class="image"
										src="images/rocky-mountain-square.jpg"> <br>
									<button class="btn btn-success text-nowrap mx-2" type="submit"
										onclick="window.location.href='goParkDetails.do?parkId=1'">
										Show Me!</button>
									<br>
								</div>
								<div class="col-sm" style="text-align: center">
									<h5 style="text-align: center">View Lodging at Mesa Verde</h5>
									<br> <img class="image" src="images/mesa-verde-square.jpg">
									<br>
									<button class="btn btn-success text-nowrap mx-2" type="submit"
										onclick="window.location.href='goParkDetails.do?parkId=2'">
										Take Me There!</button>
									<br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-10 mx-auto">
				<div class="card mt-4">
					<div>
						<div class="card-body text-center bg-light">
							<div id="carouselExampleCaptions" class="carousel slide"
								data-bs-ride="carousel" style="text-align: center;">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="0" class="active" aria-current="true"
										aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="1" aria-label="Slide 2"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="2" aria-label="Slide 3"></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="images/biking-rocky-mountain.jpg"
											class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>Take a Bike Ride in Rocky Mountain National Park</h5>
										</div>
									</div>
									<div class="carousel-item">
										<img src="images/food-mesa-verde.jpg" class="d-block w-100"
											alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>Enjoy the Food at Mesa Verde National Park</h5>
										</div>
									</div>
									<div class="carousel-item">
										<img src="images/climbing-rocky-mountain.jpg"
											class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>Try the Rock Climbing at Rocky Mountain National
												Park</h5>
										</div>
									</div>

									<div class="carousel-item">
										<img src="images/lodging-zion.jpg" class="d-block w-100"
											alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>Check Out Places to Stay at Zion National Park</h5>
										</div>
									</div>

									<div class="carousel-item">
										<img src="images/hiking-bryce-canyon.jpg"
											class="d-block w-100" alt="...">
										<div class="carousel-caption d-none d-md-block">
											<h5>See the Many Hikes at Bryce Canyon National Park</h5>
										</div>
									</div>

								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
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