<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="./css/stylesheet.css">
    	<!-- <script type="text/javascript" src="script.js" -->
    	<meta name="author" content="Dominik MÃ¼ller, Daniel ReiÃ, Harald Schwirzenbeck">
		<title>Megaquiz</title>
	</head>
	<body>
		<h1>Megaquiz</h1>
			<fieldset><legend>Login-Formular</legend>
				<form action="login.jsp">
					<div>
						<label for="email">E-Mail:</label>
						<input type="email" name="email" id="email" placeholder="example@example.net" required />
						<label for="email"></label>
					</div>
					<div>
						<label for="password">Passwort:</label>
						<input type="password" name="password" id="password" required />
						<label for="password"></label>
					</div>
					<div>
						<button type="submit">Login</button>
						<button type="submit">Registrieren</button>
					</div>
					<div>Highscore Tabelle</div>
					<p>(*) = Eingabe erforderlich</p>
				</form>
			</fieldset>
	</body>
</html>