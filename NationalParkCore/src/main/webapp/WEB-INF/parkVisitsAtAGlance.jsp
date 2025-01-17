<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="row">
		<div class="col-md-11 mx-auto">
			<div class="card mt-4">
				<div class="card-body">
					<h2 style="text-align: center;">Your Park Visits At A Glance</h2>
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
									<td><fmt:parseDate value="${parkVisit.startDate}"
											pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
											value="${parsedDate}" var="newParsedDate" type="date"
											pattern="MMM d, yyyy" />${newParsedDate}</td>
									<td><fmt:parseDate value="${parkVisit.endDate}"
											pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
											value="${parsedDate}" var="newParsedDate" type="date"
											pattern="MMM d, yyyy" />${newParsedDate}</td>
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
									<td><fmt:parseDate value="${parkVisit.lastUpdate}"
											pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="MMM d, yyyy hh:mm a" /></td>
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