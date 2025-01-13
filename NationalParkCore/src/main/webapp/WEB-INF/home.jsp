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
<link rel="icon" type="image/png" href="images/cooki-jar.ico" />
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
<div>
	<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
		<a class="navbar-brand" href="#"><img
			src="images/national-parkcore-logo.png" width="120" height="150"
			class="d-inline-block align-top" alt=""> </a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav nav-fill w-100 mr-100">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Parks </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Parks</a> <a
							class="dropdown-item" href="#">California</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Colorado</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Utah</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Activities </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Parks</a> <a
							class="dropdown-item" href="#">California</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Colorado</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Utah</a>
					</div>
				<li class="nav-item"><a class="nav-link" href="#">Create
						Account</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Log In</a></li>
			</ul>
			<div class="text-right">
				<form
					class="d-flex align-items-center flex-nowrap form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
</div>
<br>
<br>
<body>
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