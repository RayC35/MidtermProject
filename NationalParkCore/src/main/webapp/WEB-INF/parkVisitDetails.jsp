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
			<div class="col-md-9 mx-auto">
				<div class="card mt-4">
					<div>
						<div class="card-body text-center bg-light">
							<br> <br>
							<h2>${parkVisit.title}</h2>
							<p>Posted On:&nbsp;${parkVisit.createDate}</p>
							<img class="parkVisitImage" width="50%"
								src="${parkVisit.imageURL}"> <br> <br>
							<h4>Park Visited:</h4>
							<h4>${parkVisit.startDate}&nbsp;-&nbsp;${parkVisit.endDate}</h4>
							<br>
							<hr>
							<br>
							<h2>Rating:&nbsp;${parkVisit.rating}</h2>
							<div class="container">
								<div class="row">
									<div class="col-md-11 mx-auto">
										<div class="card mt-1">
											<br>
											<p class="mx-4">${parkVisit.remarks}</p>
										</div>
									</div>
								</div>
							</div>
							<p>Last Updated:&nbsp;${parkVisit.lastUpdate}</p>
							<br>
							<c:if test="${loggedInUser.id == parkVisit.user.id}">
								<button class="btn btn-primary mx-2" type="submit"
									onclick="window.location.href='goEditParkVisit.do'">
									Edit Park Visit <i class="bi bi-person-walking"></i>
								</button>
							</c:if>
							<button class="btn btn-success mx-2" type="submit"
								onclick="window.location.href='listAllUserParkVisits.do?userId=${loggedInUser.id}'">
								Back To Park Visits <i class="bi bi-signpost-2-fill"></i>
							</button>
							<button class="btn btn-warning text-nowrap mx-2" type="submit"
								onclick="window.location.href='goUserProfile.do'">
								My Account <i class="bi bi-tree-fill"></i>
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