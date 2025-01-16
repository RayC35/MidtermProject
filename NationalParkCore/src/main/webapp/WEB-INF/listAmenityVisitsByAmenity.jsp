<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amenity Visits By Amenity</title>
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
			<div class="col-md-11 mx-auto">
				<div class="card mt-4">
					<div class="card-body">
						<h2 style="text-align: center;">Amenity Visits</h2>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Amenity</th>
									<th>Rating</th>
									<th>Remarks</th>
									<th>Last Update</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="amenityVisit" items="${amenityVisitList}">
									<c:if test="${empty id}">
										<tr>
									</c:if>
									<c:if test="${! empty id}">
										<c:if test="${amenityVisit.id == id}">
											<tr class="found">
										</c:if>
										<c:if test="${amenityVisit.id != id}">
											<tr>
										</c:if>
									</c:if>
									<tr>
										<td><a
											href="<c:url value='amenityVisitDetails.do'><c:param name='amenityVisitId' value='${amenityVisit.id}'/></c:url>">
												${amenityVisit.amenity.name}</a></td>
										<td><c:if test="${parkVisit.rating == 1}">
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
										<td>${amenityVisit.remarks}</td>
										<td>${amenityVisit.lastUpdate}</td>
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