<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
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
			<div class="col-md-7 mx-auto">
				<div class="card mt-4">
					<div>
						<div class="card-body text-center bg-light">
							<br> <br>
							<h2>Sign In To Your Profile</h2>
							<br>
							<form action="login.do" method="POST">
								<p>
									<label>Username:</label> <input type="text" name="username"
										id="username">
								</p>
								<p>
									<label>Password:</label> <input type="password" name="password"
										id="password" /> <i class="bi bi-eye-slash"
										id="togglePassword"></i>
								</p>
								<button class="btn btn-success text-nowrap" type="submit"
									id="submit">Log In</button>
							</form>
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
	<script>
        const togglePassword = document
            .querySelector('#togglePassword');
        const password = document.querySelector('#password');
        togglePassword.addEventListener('click', () => {
            // Toggle the type attribute using
            // getAttribure() method
            const type = password
                .getAttribute('type') === 'password' ?
                'text' : 'password';
            password.setAttribute('type', type);
            // Toggle the eye and bi-eye icon
            this.classList.toggle('bi-eye');
        });
    </script>
</body>
</html>