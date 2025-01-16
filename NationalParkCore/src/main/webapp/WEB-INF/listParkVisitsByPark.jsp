<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park Visits By Park</title>
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
						<h2 style="text-align: center;">Park Visits</h2>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Title</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Rating</th>
									<th>Last Update</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="parkVisit" items="${parkVisitList}">
									<c:if test="${empty id}">
										<tr>
									</c:if>
									<c:if test="${! empty id}">
										<c:if test="${parkVisit.id == id}">
											<tr class="found">
										</c:if>
										<c:if test="${parkVisit.id != id}">
											<tr>
										</c:if>
									</c:if>
									<tr>
										<td><a
											href="<c:url value='parkVisitDetails.do'><c:param name='parkVisitId' value='${parkVisit.id}'/></c:url>">
												${parkVisit.title}</a></td>
										<td>${parkVisit.startDate}</td>
										<td>${parkVisit.endDate}</td>
										<td><c:if test="${parkVisit.rating == 1}">
												<p style="color: orange;">★☆☆☆☆</p>
											</c:if> <c:if test="${parkVisit.rating == 2}">
												<p style="color: orange;">★★☆☆☆</p>
											</c:if> <c:if test="${parkVisit.rating == 3}">
												<p style="color: orange;">★★★☆☆</p>
											</c:if> <c:if test="${parkVisit.rating == 4}">
												<p style="color: orange;">★★★★☆</p>
											</c:if> <c:if test="${parkVisit.rating == 5}">
												<p style="color: orange;">★★★★★</p>
											</c:if></td>
										<td>${parkVisit.createDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<div style="text-align: center;">
							<button class="btn btn-success" type="button"
								onclick="history.back()">
								Go Back <i class="bi bi-tree"></i>
							</button>
						</div>
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