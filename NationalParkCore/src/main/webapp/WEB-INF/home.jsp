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
								<h2 style="text-align: center">
									<strong>Featured Parks:</strong>
								</h2>
								<br> <br> <br> <br>
								<div class="col-sm">
									<div class="col-sm" style="text-align: center">
										<h5 style="text-align: center">
											<strong>Check Out Zion's Activities</strong>
										</h5>
										<img class="image" src="images/zion-square.jpg"> <br>
										<button class="btn btn-success text-nowrap mx-2" type="submit"
											onclick="window.location.href='parkDetails.do?parkId=9'">
											Check Them Out!</button>
										<br>
									</div>
								</div>
								<div class="col-sm" style="text-align: center">
									<h5 style="text-align: center">
										<strong>Food at Rocky Mountain</strong>
									</h5>
									<img class="image" src="images/rocky-mountain-square.jpg">
									<br>
									<button class="btn btn-success text-nowrap mx-2" type="submit"
										onclick="window.location.href='parkDetails.do?parkId=1'">
										Show Me!</button>
									<br>
								</div>
								<div class="col-sm" style="text-align: center">
									<h5 style="text-align: center">
										<strong>View Lodging at Mesa Verde</strong>
									</h5>
									<img class="image" src="images/mesa-verde-square.jpg"> <br>
									<button class="btn btn-success text-nowrap mx-2" type="submit"
										onclick="window.location.href='parkDetails.do?parkId=2'">
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
		<div class="container">
			<div class="row">
				<div class="col-md-12 mx-auto">
					<div class="card mt-2">
						<div class="card-body">
							<div class="container">
								<div class="row">
									<h2 style="text-align: center">
										<strong>Stellar Reviews:</strong>
									</h2>
									<br> <br> <br> <br>
									<div class="col-sm">
										<div class="col-sm" style="text-align: center">
											<h5 style="text-align: center">
												<strong>Capitol Reef</strong>
											</h5>
											<p style="color: orange;">★★★★☆</p>
											<figure class="text-center">
												<blockquote class="blockquote">
													<p>My friends and I visited the Capitol Reef National
														Park from September 20-25, 2024, and it was an
														unforgettable experience. The park's stunning red rock
														landscapes and unique geological formations took our
														breath away, and we enjoyed several of the hiking trails.
														The Fruita Campground was the perfect base for our
														adventures, and we were able to relax under the stars
														after a day of exploring. Highly recommend for nature
														lovers and families looking for a quieter park to visit!</p>
												</blockquote>
												<figcaption class="blockquote-footer">Larry
													Kong, Hardcore National ParkCore-er</figcaption>
											</figure>
											<br>
											<button class="btn btn-success text-nowrap mx-2"
												type="submit"
												onclick="window.location.href='parkDetails.do?parkId=8'">
												Explore Capitol Reef!</button>
											<br>
										</div>
									</div>
									<div class="col-sm" style="text-align: center">
										<h5 style="text-align: center">
											<strong>Rocky Mountain</strong>
										</h5>
										<p style="color: orange;">★★★★★</p>
										<figure class="text-center">
											<blockquote class="blockquote">
												<p>Rocky Mountain National Park is absolutely majestic!
													A wonderful display of colorful meadows, evergreen forests,
													alpine tundra far above the tree line, numerous superb
													hiking trails, stunning clear mountain lakes, spectacular
													drives, and up-close encounters with impressive wildlife!
													We enjoyed every minute of the three days we spent
													exploring RMNP. Yes, you do need a timed permit during the
													Parks' busy season. If you do your homework, you are
													prepared. The permits were easy to acquire if you got on
													the website about a month in advance. No permit needed the
													rest of the year, though (Oct 20th)!</p>
											</blockquote>
											<figcaption class="blockquote-footer">Steve
												Striker, Expert Climber-crawler</figcaption>
										</figure>
										<br>
										<button class="btn btn-success text-nowrap mx-2" type="submit"
											onclick="window.location.href='parkDetails.do?parkId=1'">
											Explore Rocky Mountain!</button>
										<br>
									</div>
									<div class="col-sm" style="text-align: center">
										<h5 style="text-align: center">
											<strong>Zion</strong>
										</h5>
										<p style="color: orange;">★★★★★</p>
										<figure class="text-center">
											<blockquote class="blockquote">
												<p>My friend and I spent three unforgettable days at
													Zion National Park, and let's just say, the views were
													almost as wild as the hikes themselves. We tackled Angels
													Landing and The Narrows. The park’s shuttle system was a
													lifesaver—perfect for when our legs were too tired from
													hiking (and maybe other activities we enjoyed to enhance
													the experience). Between the psychedelic rock formations
													and the natural beauty, Zion left us both wondering if
													maybe the rocks were speaking to us... or maybe it was just
													the desert heat. Either way, can’t wait to go back!</p>
											</blockquote>
											<figcaption class="blockquote-footer">Buffy Hua,
												Pro Mosquito-dodger</figcaption>
										</figure>
										<br>
										<button class="btn btn-success text-nowrap mx-2" type="submit"
											onclick="window.location.href='parkDetails.do?parkId=9'">
											Explore Zion!</button>
										<br>
									</div>
								</div>
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