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
<style>
.navbar {
	left: 100px;
	right: 100px;
}

html body {
	background-image: url('images/national-parkcore-background.jpg');
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

.image {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}

.top {
	margin-top: calc(100vh + var(--offset));
	text-decoration: none;
	padding: 10px;
	font-family: sans-serif;
	color: #fff;
	background: #333366;
	border-radius: 10px;
}

footer {
	text-align: center;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
		<a class="navbar-brand ml-4" href="#"><img
			src="images/national-parkcore-logo.png" width="120" height="150"
			class="d-inline-block align-top" alt=""> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav w-100 mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="#">Home
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Parks </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Activities </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
			<button class="btn btn-success text-nowrap mx-2"
				formaction="goRegister.do" type="button">
				Create Account <i class="bi bi-tree"></i>
			</button>
			<button class="btn btn-success text-nowrap mx-2"
				formaction="goLogIn.do" type="button">
				Log In <i class="bi bi-signpost-2"></i>
			</button>
			<form
				class="form-inline mx-2 d-flex align-items-center flex-nowrap ml-auto">
				<input class="form-control mr-sm-2 form-inline" type="search"
					placeholder="Search">
				<button class="btn btn-outline-success mr-4" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-7 mx-auto">
				<div class="card mt-2">
					<div class="card-body">
						<h1 style="text-align: center">Welcome to National ParkCore!</h1>

						<img class="image" style="text-align: center"
							src="https://i.makeagif.com/media/5-12-2015/cL5D-2.gif">
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-7 mx-auto">
				<div class="card mt-2">
					<div class="card-body">
						<footer>
							<br> <a href="#" class="top">Go To Top <i
								class="bi bi-tree"></i></a> <br> <br>
							<p>
								<script type="text/javascript">
									var date = new Date(), year = date
											.getFullYear(), text = "All Rights Reserved &#xA9; "
											+ year + " - National ParkCore", html = '<div class="text-align-center">'
											+ text + '</div>';

									document.write(html);
								</script>
							</p>
						</footer>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>