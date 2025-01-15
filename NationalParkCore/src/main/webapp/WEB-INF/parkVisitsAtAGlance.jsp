<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="container">
	<div class="row">
		<div class="col-md-11 mx-auto">
			<div class="card mt-4">
				<div class="card-body">
					<h2 style="text-align: center;">Park Visits At A Glance</h2>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Title</th>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Rating</th>
								<th>Create Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="parkVisit" items="${parkVisitList}">
								<%-- <c:if test="${empty id}">
									<tr>
								</c:if>
								<c:if test="${! empty id}">
									<c:if test="${parkVisit.id == id}">
										<tr class="found">
									</c:if>
									<c:if test="${parkVisit.id != id}">
										<tr>
									</c:if>
								</c:if> --%>
								<tr>
									<td><a
										href="<c:url value='parkVisitDetails.do'><c:param name='parkVisitId' value='${parkVisit.id}'/></c:url>">
											${parkVisit.title}</a></td>
									<td>${parkVisit.startDate}</td>
									<td>${parkVisit.endDate}</td>
									<td>${parkVisit.rating}</td>
									<td>${parkVisit.createDate}</td>
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