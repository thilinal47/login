<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>

<link rel="stylesheet"
	href="https://necolas.github.io/normalize.css/5.0.0/normalize.css">
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>

<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
<link href="<c:url value='/static/css/main.css' />" rel="stylesheet"></link>
</head>
<body>
	<header>
		<div class="container">
			<div class="row">
				<div class="logo col-md-4 ">
					<h1>
						<a href=""><img src="<c:url value='/static/img/Logo.png' />"
							alt="logo" /></a>
					</h1>
				</div>
				<div class="col-md-8">
					<nav class="pull-right">
						<ul>
							<li><a href="">Features</a></li>
							<li><a href="">Review </a></li>
							<li><a href="">Pricing</a></li>
							<li><a href="<c:url value='/login' />">Sign-In</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<div class="main">
		<div class="container">
			<div class="topic">
				<h2>DESIGN FOR RESULT</h2>
				<h4>Optimized to get high conversion rates.</h4>
			</div>
			<div class="content">
				<div class=row>

					<iframe width="650" height="415"
						src="https://www.youtube.com/embed/sGbxmsDFVnE" frameborder="0"
						allowfullscreen></iframe>

					<div class="pull-right col-md-5 reg-form">
						<div class="form-head">
							<h4>Sign Up</h4>
							<h5>All Fields Required.</h5>
						</div>
						<form:form method="POST" action="sendData" class=""
							modelAttribute="registerForm">
							<div class="form-group">
								<form:errors path="username" cssStyle="font-size:11px; color: white"
									cssclass="error"></form:errors>
								<form:input class="form-control" placeholder="User Name"
									path="username" />
							</div>

							<div class="form-group">
								<form:errors path="email" cssStyle="font-size:11px; color: white;"
									cssclass="error"></form:errors>
								<form:input class="form-control" placeholder="Email"
									path="email" />

							</div>

							<div class="form-group">
								<form:errors path="password" cssStyle="font-size:11px;color: white;"
									cssclass="error"></form:errors>
								<form:password class="form-control" placeholder="Password"
									path="password" />

							</div>
							<div class="form-group">
							<form:errors path="rePassword" cssStyle="font-size:11px;color: white;"
									cssclass="error"></form:errors>
								<form:password path="rePassword" class="form-control"
									placeholder="Re Enter Password" />
							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />



							<input type="submit" value="Register" class="btn btn-primary">
						</form:form>
						<h5>We value your privacy.</h5>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer>
		<div class="container">
			<h4>© 2015 Finetech. All Rights Reserved.</h4>
		</div>

	</footer>

</body>
</html>