<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="home/css/stylesheet.css">
    	<!-- <script type="text/javascript" src="script.js" -->
    	<meta name="author" content="Dominik MÃ¼ller, Daniel ReiÃ, Harald Schwirzenbeck">
		<title>Megaquiz</title>
	</head>
	<body>
		<h1>Megaquiz</h1>
			<fieldset><legend>Login-Formular</legend>
				<form action="/thi-quiz-war/quizmanagement" id="loginForm" method="post">
					<div>
						<label for="userName">E-Mail:</label>
						<input type="text" name="userName" id="userName" placeholder="example@example.net" required />
						<label for="userName"></label>
					</div>
					<div>
						<label for="password">Passwort:</label>
						<input type="password" name="password" id="password" required />
						<label for="password"></label>
					</div>
					<div>
						<button type="submit" name="action" value="login">Login</button>
						<button type="submit" name="action" value="register">Registrieren</button>
					</div>
					<div>Highscore Tabelle</div>
					<p>(*) = Eingabe erforderlich</p>
				</form>
			</fieldset>
	</body>
</html>