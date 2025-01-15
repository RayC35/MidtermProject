<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="accordion" id="accordionExample">
	<c:forEach var="amenityEntry" items="${amenities}">
	<div class="accordion-item">
		<h2 class="accordion-header">
			<button class="accordion-button" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseOne${amenityEntry.key }"
				aria-expanded="true" aria-controls="collapseOne">${amenityEntry.key }</button>
		</h2>
		<c:forEach var="amenity" items="${amenityEntry.value}">
		<div id="collapseOne${amenityEntry.key }" class="accordion-collapse collapse"
			data-bs-parent="#accordionExample">
			<div class="accordion-body">
				<p>${amenity.name }</p>
			</div>
		</div>
		</c:forEach>
	</div>
	</c:forEach>
</div>