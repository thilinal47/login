<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
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
							<li><a href="<c:url value='register' />">Register</a></li>
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
						<div class="login-form">
							<c:url var="loginUrl" value="/login" />
							<form action="${loginUrl}" method="post" class="form-horizontal">
								<c:if test="${param.error != null}">
									<div class="alert alert-danger">
										<p>Invalid username and password.</p>
									</div>
								</c:if>
								<c:if test="${param.logout != null}">
									<div class="alert alert-success">
										<p>You have been logged out successfully.</p>
									</div>
								</c:if>
								<div class="form-group">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="Enter Username" required>

								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Enter Password" required>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<div>
									<input type="submit" class="btn btn-primary" value="Log in">
								</div>
							</form>
						</div>
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