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
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-11 mx-auto">
				<div class="card mt-4">
					<div class="card-body">
						<h2 style="text-align: center;">All Park Visits</h2>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Title</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Rating</th>
									<th>Create Date</th>
									<th>Last Update</th>
									<th>Published</th>
									<th>Enabled</th>
									<th>Edit</th>
									<th>Disable</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="parkVisit" items="${parkVisitList}">
									<c:if test="${empty title}">
										<tr>
									</c:if>
									<c:if test="${! empty title}">
										<c:if test="${parkVisit.title == title}">
											<tr class="found">
										</c:if>
										<c:if test="${parkVisit.title != title}">
											<tr>
										</c:if>
									</c:if>
									<tr>
										<td><a
											href="<c:url value='goParkVisit.do'><c:param name='parkVisitId' value='${parkVisit.id}'/></c:url>">
												${parkVisit.title}</a></td>
										<td>${parkVisit.startDate}</td>
										<td>${parkVisit.endDate}</td>
										<td>${parkVisit.rating}</td>
										<td>${parkVisit.createDate}</td>
										<td>${parkVisit.lastUpdate}</td>
										<td>${parkVisit.published}</td>
										<td>${parkVisit.enabled}</td>
										<td><button class="btn btn-warning" type="submit"
												onclick="window.location.href='goEditParkVisit.do?parkVisitId=${parkVisit.id}'">
												Edit</button></td>
										<td><c:if test="${parkVisit.enabled == 'true'}">
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
											</c:if></td>
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
