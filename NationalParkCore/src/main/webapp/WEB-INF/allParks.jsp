<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park Details</title>
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
			<div class="col-md-8 mx-auto">
				<div class="card mt-4">
					<div class="card-body">
						<br> <br>
						<h2 style="text-align: center;">All National Parks</h2>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>State</th>
									<th>Website</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="park" items="${parkList}">
									<c:if test="${empty name}">
										<tr>
									</c:if>
									<c:if test="${! empty name}">
										<c:if test="${park.name == name}">
											<tr class="found">
										</c:if>
										<c:if test="${park.name != name}">
											<tr>
										</c:if>
									</c:if>
									<tr>
										<td>${park.id}</td>
										<td><a
											href="<c:url value='parkDetails.do'><c:param name='parkId' value='${park.id}'/></c:url>">
												${park.name}</a></td>
										<td>${park.stateAbbreviation}</td>
										<td><a href="${park.websiteURL}" target="_blank">View
												Website</a></td>
												<td><button class="btn btn-warning" type="submit"
											onclick="window.location.href='goAdminEditUserProfile.do?userId=${user.id}'">
												Edit</button></td>
										<td><c:if test="${user.role == 'user'}">
												<form action="adminDisableUser.do" method="POST"
													onsubmit="return window.confirm('Confirm Disable?');">
													<div class="form-group">
														<input type="hidden" class="form-control" id="id"
															name="id" value="<c:out value='${user.id}' />">
													</div>
													<button type="submit" class="btn btn-danger">Disable</button>
												</form>
											</c:if> <c:if test="${user.role == 'admin'}">
												<p class="unable">
													<i class="bi bi-exclamation-octagon"></i>
												</p>
											</c:if></td>
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
						<br> <br>
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