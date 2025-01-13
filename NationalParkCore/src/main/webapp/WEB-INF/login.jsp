<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In Screen</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
<h2>Log In</h2>
<form action="login.do" method="POST">
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>
</body>
</html>