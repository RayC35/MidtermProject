<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 mx-auto">
			<div class="card mt-4">
				<div class="card-body">
					<br> <br>
					<h2 style="text-align: center;">All Amenities</h2>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Park</th>
								<th>Cost Range</th>
								<th>Website</th>
								<th>Enabled</th>
								<th>Last Update</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="amenity" items="${amenityList}">
								<c:if test="${empty name}">
									<tr>
								</c:if>
								<c:if test="${! empty name}">
									<c:if test="${amenity.name == name}">
										<tr class="found">
									</c:if>
									<c:if test="${amenity.name != name}">
										<tr>
									</c:if>
								</c:if>
								<tr>
									<td>${amenity.id}</td>
									<td><a
										href="<c:url value='amenityDetails.do'><c:param name='amenityId' 
				      value='${amenity.id}'/></c:url>">${amenity.name}</a></td>
									<td>${amenity.park.name}</td>
									<td><c:if test="${amenity.costRange == 0}">
											<p>FREE</p>
										</c:if> <c:if test="${amenity.costRange == 1}">
											<p>$</p>
										</c:if> <c:if test="${amenity.costRange == 2}">
											<p>$$</p>
										</c:if> <c:if test="${amenity.costRange == 3}">
											<p>$$$</p>
										</c:if></td>
									<td><a href="${amenity.websiteURL}" target="_blank">View
											Website</a></td>
									<td style="text-align: center; vertical-align: middle;"><c:if
											test="${amenity.enabled == true}">
											<h2 style="color: green;">&#9745;</h2>
										</c:if> <c:if test="${amenity.enabled == false}">
											<h2 style="color: red;">x</h2>
										</c:if></td>
									<td><fmt:parseDate value="${amenity.lastUpdate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="MMM d, yyyy hh:mm a" /></td>
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
