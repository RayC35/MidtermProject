<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="row">
		<div class="col-md-11 mx-auto">
			<div class="card mt-4">
				<div class="card-body">
					<br> <br>
					<h2 style="text-align: center;">All Users</h2>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID</th>
								<th>Username</th>
								<th>Enabled</th>
								<th>Role</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Create Date</th>
								<th>Last Update</th>
								<th>Email</th>
								<th>Edit</th>
								<th>Disable</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${userList}">
								<c:if test="${empty name}">
									<tr>
								</c:if>
								<c:if test="${! empty name}">
									<c:if test="${user.name == name}">
										<tr class="found">
									</c:if>
									<c:if test="${user.name != name}">
										<tr>
									</c:if>
								</c:if>
								<tr>
									<td>${user.id}</td>
									<td><a
										href="<c:url value='adminGoUserProfile.do'><c:param name='userId' value='${user.id}'/></c:url>">
											${user.username}</a></td>
									<td>${user.enabled}</td>
									<td>${user.role}</td>
									<td>${user.firstName}</td>
									<td>${user.lastName}</td>
									<td><fmt:parseDate value="${user.createDate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="MMM d, yyyy hh:mm a" /></td>
									<td><fmt:parseDate value="${user.lastUpdate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="MMM d, yyyy hh:mm a" /></td>
									<td>${user.email}</td>
									<td><button class="btn btn-warning" type="submit"
											onclick="window.location.href='goAdminEditUserProfile.do?userId=${user.id}'">
											Edit</button></td>
									<td><c:if
											test="${user.role == 'user' && user.enabled == 'true'}">
											<form action="adminDisableUser.do?userId=${user.id}" method="POST"
												onsubmit="return window.confirm('Confirm Disable?');">
												<div class="form-group">
													<input type="hidden" class="form-control" id="id" name="id"
														value="<c:out value='${user.id}' />">
												</div>
												<button type="submit" class="btn btn-danger">Disable</button>
											</form>
										</c:if> <c:if test="${user.enabled == 'false'}">
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
