<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome page</title>
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
							<li><a href="javascript:formSubmit()">Log-out</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<div class="main">
		<div class="container">
			<sec:authorize access="hasRole('ROLE_USER')">
				<!-- For login user -->
				<c:url value="/logout" var="logoutUrl" />
				<form action="${logoutUrl}" method="post" id="logoutForm">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<script>
					function formSubmit() {
						document.getElementById("logoutForm").submit();
					}
				</script>

				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<h2>
						Welcome, ${pageContext.request.userPrincipal.name} 
					</h2>
				</c:if>


			</sec:authorize>
		</div>
	</div>
	<footer>
		<div class="container">
			<h4>© 2015 Finetech. All Rights Reserved.</h4>
		</div>

	</footer>
</body>
</html>