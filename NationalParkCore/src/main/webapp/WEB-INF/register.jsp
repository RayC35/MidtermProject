<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
</head>
<body>
	<jsp:include page="nav.jsp" />

<form action="register.do" method = "POST">
<input type = "text" name = "username" required>Username
<input type = "password" name = "password" required>Password
<input type = "text" name = "firstName" required>First Name
<input type = "text" name = "lastName" required>Last Name
<input type = "email" name = "email">Email
<textarea name = "biography" >Biography</textarea>
<input type = "text" name = "imageURL">Profile Image URL
<input type = "submit" name = "Register">
</form>
</body>
</html>