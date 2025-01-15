<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Park Visit Details</title>
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
			<div class="col-md-7 mx-auto">
				<div class="card mt-4">
					<div>
						<div class="card-body text-center bg-light">
							<br> <br>
							<h2>${parkVisit.title}:&nbsp;${parkVisit.createDate}</h2>
							<img src="${parkVisit.imageURL}"> <br> <br>
							<h3>${parkVisit.startDate}&nbsp;-&nbsp;${parkVisit.endDate}</h3>
							<br>
							<hr>
							<h4>Rating:&nbsp;${parkVisit.rating}</h4>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<p>${parkVisit.remarks}</p>
										</div>
									</div>
								</div>
							</div>
							<h4>${parkVisit.lastUpdate}</h4>
							<br>
							<c:if test="${loggedInUser.id == parkVisit.user.id}">
								<button class="btn btn-warning mr-4" type="submit"
									onclick="window.location.href='goEditParkVisit.do'">
									Edit Visit <i class="bi bi-signpost-2"></i>
								</button>
							</c:if>
							<button class="btn btn-primary" type="submit"
								onclick="window.location.href='goParkVisits.do'">
								Back To Park Visits <i class="bi bi-tree"></i>
							</button>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>