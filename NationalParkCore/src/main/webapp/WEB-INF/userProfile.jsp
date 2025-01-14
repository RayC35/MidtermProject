<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="nav.jsp" />
 
${loggedInUser.username}
${loggedInUser.firstName}
${loggedInUser.lastName}
${loggedInUser.email}
${loggedInUser.biography}
${loggedInUser.imageURL}

<form action="logout.do" method="GET">
	<input class="submit-button" type="submit" value="Log Out"
		title="Log Out" />
</form>
</body>
</html>