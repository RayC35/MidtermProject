<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div class="container">
	<div class="row">
		<div class="col-md-11 mx-auto">
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
								<th>Create Date</th>
								<th>Last Update</th>
								<th>Edit</th>
								<th>Disable</th>
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
										href="<c:url value='adminGoAmenity.do'><c:param name='amenityId' value='${amenity.id}'/></c:url>">
											${amenity.name}</a></td>
									<td>${park.name}</td>
									<td>${amenity.costRange}</td>
									<td>${amenity.websiteURL}</td>
									<td>${amenity.enabled}</td>
									<td>${amenity.createDate}</td>
									<td>${amenity.lastUpdate}</td>
									<td><button class="btn btn-warning" type="submit"
											onclick="window.location.href='goAdminEditAmenity.do?amenityId=${amenity.id}'">
											Edit</button></td>
									<td><c:if
											test="${user.role == 'user' && user.enabled == 'true'}">
											<form action="adminDisableAmenity.do" method="POST"
												onsubmit="return window.confirm('Confirm Disable?');">
												<div class="form-group">
													<input type="hidden" class="form-control" id="id" name="id"
														value="<c:out value='${amenity.id}' />">
												</div>
												<button type="submit" class="btn btn-danger">Disable</button>
											</form>
										</c:if> <c:if test="${amenity.enabled == 'false'}">
											<p class="unable">Disabled</p>
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
