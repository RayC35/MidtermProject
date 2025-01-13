<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
	<a class="navbar-brand ml-4" href="#"><img
		src="images/national-parkcore-logo.png" width="120" height="150"
		class="d-inline-block align-top" alt=""> </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
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
		<c:choose>
			<c:when test="${loggedInUser.Id > 0}">
				<a href="userProfile.do">My Profile <i class="bi bi-tree-fill"></i></a>
				<a href="logout.do">Log Out <i class="bi bi-signpost-2-fill"></i></a>
			</c:when>
			<c:otherwise>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goRegister.do'">
					Register Account <i class="bi bi-tree"></i>
				</button>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goLogIn.do'">
					Log In <i class="bi bi-signpost-2"></i>
				</button>
				<form
					class="form-inline mx-2 d-flex align-items-center flex-nowrap ml-auto">
					<input class="form-control mr-sm-2 form-inline" type="search"
						placeholder="Search">
					<button class="btn btn-outline-success mr-4" type="submit">Search</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</nav>