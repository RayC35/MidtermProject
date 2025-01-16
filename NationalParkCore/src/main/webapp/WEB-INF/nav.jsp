<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
	<a class="navbar-brand ml-4" href="home.do"><img
		src="images/national-parkcore-logo.png" width="120" height="150"
		class="d-inline-block align-top" alt=""> </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav w-100 mt-2 mt-lg-0">
			<li class="nav-item active"><a class="nav-link" href="home.do">Home
			</a></li>
			<li class="nav-item"><a class="nav-link" href="listAllParks.do">Explore
					Parks</a></li>
			<li class="nav-item"><a class="nav-link"
				href="listAllAmenityVisitsByAmenityId.do">View Amenities</a></li>
		</ul>
		<c:choose>
			<c:when
				test="${not empty loggedInUser && loggedInUser.role == 'admin'}">
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='listAllUsers.do'">
					User Admin <i class="bi bi-person-lines-fill"></i>
				</button>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goUserProfile.do'">
					My Account <i class="bi bi-tree-fill"></i>
				</button>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='logout.do'">
					Log Out <i class="bi bi-signpost-2-fill"></i>
				</button>
				<form
					class="form-inline mx-2 d-flex align-items-center flex-nowrap ml-auto">
					<input class="form-control mr-sm-2 form-inline" type="search"
						placeholder="Search">
					<button class="btn btn-outline-success mr-4" type="submit">Search</button>
				</form>
			</c:when>
			<c:when
				test="${not empty loggedInUser && loggedInUser.role == 'user'}">
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goUserProfile.do'">
					My Account <i class="bi bi-tree-fill"></i>
				</button>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='logout.do'">
					Log Out <i class="bi bi-signpost-2-fill"></i>
				</button>
				<form
					class="form-inline mx-2 d-flex align-items-center flex-nowrap ml-auto w-25">
					<input class="form-control mr-sm-2 form-inline" type="search"
						placeholder="Search">
					<button class="btn btn-outline-success mr-4" type="submit">Search</button>
				</form>
			</c:when>
			<c:otherwise>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goRegister.do'">
					Register Account <i class="bi bi-tree"></i>
				</button>
				<button class="btn btn-success text-nowrap mx-2" type="submit"
					onclick="window.location.href='goLogin.do'">
					Log In <i class="bi bi-signpost-2"></i>
				</button>
				<form
					class="form-inline mx-2 d-flex align-items-center flex-nowrap ml-auto w-25">
					<input class="form-control mr-sm-2 form-inline" type="search"
						placeholder="Search">
					<button class="btn btn-outline-success mr-4" type="submit">Search</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</nav>