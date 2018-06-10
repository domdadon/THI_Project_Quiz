<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="fehlerausgabe.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- <base href="${pageContext.request.requestURI}" /> -->
		<title>Insert title here</title>
</head>
<body>
	Fehler provozieren
		<% String irgendwas = null;	out.println(irgendwas.toString()); %>
		
	
	<h1>Willkommen beim Megaquiz</h1>
	<br><b>Bitte melden Sie sich an!</b>
	<form id="loginForm" action="../UserManagement" method="post">
		<div>
			<label for="username">Benutzername:</label>
			<input type="text" id="username" name="username">
		</div>
		<div>
			<label for="password">Passwort:</label>
			<input type="password" id="password" name="password">
		</div>
		<div>
			<button type="submit" name="login" value="login">Anmelden</button>
		</div>
	</form>
</body>
</html>