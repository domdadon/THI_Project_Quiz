<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<button type="submit" action="login" value="login">Anmelden</button>
		</div>
	</form>
</body>
</html>