<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Amenity Visits</title>
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
			<div class="col-md-13 mx-auto">
				<div class="card mt-4">
					<div class="card-body">
						<h2 style="text-align: center;">All Amenity Visits</h2>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Cost Range</th>
									<th>Create Date</th>
									<th>Last Update</th>
									<th>Date Visited</th>
									<th>Rating</th>
									<th>Website</th>
									<!-- <th>Edit</th>
									<th>Disable</th>
 -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="amenityList" items="${amenityList}">
									<c:if test="${empty name}">
										<tr>
									</c:if>
									<c:if test="${! empty name}">
										<c:if test="${amenityVisit.name == name}">
											<tr class="found">
										</c:if>
										<c:if test="${amenityVisit.name != name}">
											<tr>
										</c:if>
									</c:if>
									<tr>
										<td><a
											href="<c:url value='amenityVisitDetails.do'><c:param name='amenityVisitId' value='${amenityVisit.id}'/></c:url>">
												${amenityVisit.name}</a></td>
										<td><c:if test="${amenity.costRange == 0}">
												<p>FREE</p>
											</c:if> <c:if test="${amenity.costRange == 1}">
												<p>$</p>
											</c:if> <c:if test="${amenity.costRange == 2}">
												<p>$$</p>
											</c:if> <c:if test="${amenity.costRange == 3}">
												<p>$$$</p>
											</c:if></td>
										<td>${amenityVisit.createDate}</td>
										<td>${amenityVisit.lastUpdate}</td>
										<td>${amenityVisit.dateVisited}</td>
										<td><c:if test="${amenityVisit.rating == 1}">
												<p style="color: orange;">★☆☆☆☆</p>
											</c:if> <c:if test="${amenityVisit.rating == 2}">
												<p style="color: orange;">★★☆☆☆</p>
											</c:if> <c:if test="${amenityVisit.rating == 3}">
												<p style="color: orange;">★★★☆☆</p>
											</c:if> <c:if test="${amenityVisit.rating == 4}">
												<p style="color: orange;">★★★★☆</p>
											</c:if> <c:if test="${amenityVisit.rating == 5}">
												<p style="color: orange;">★★★★★</p>
											</c:if></td>
										<td>${amenity.websiteURL}</td>
										<%-- <td><button class="btn btn-warning" type="submit"
												onclick="window.location.href='goEditParkVisit.do?parkVisitId=${parkVisit.id}'">
												Edit</button></td> --%>
										<%-- <td><c:if test="${parkVisit.enabled == 'true'}">
												<form action="adminDisableparkVisit.do" method="POST"
													onsubmit="return window.confirm('Confirm Disable?');">
													<div class="form-group">
														<input type="hidden" class="form-control" id="id"
															name="id" value="<c:out value='${parkVisit.id}' />">
													</div>
													<button type="submit" class="btn btn-danger">Disable</button>
												</form>
											</c:if> <c:if test="${parkVisit.enabled == 'false'}">
												<p class="unable">Disabled</p>
											</c:if></td> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
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
