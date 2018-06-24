<%@ include file="header.jspf" %> 
	<h1>Willkommen beim Megaquiz</h1>
	<br><b>Bitte melden Sie sich an!</b>
	<form id="loginForm" action="../usermanagement" method="post">
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
<%@ include file="footer.jspf" %>