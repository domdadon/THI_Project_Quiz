<%@ include file="header.jspf" %>
			<fieldset><legend>Login-Formular</legend>
				<form action="../quizmanagement" id="loginForm" method="post">
					<div>
						<label for="userName">Benutzername</label>
						<input type="text" name="userName" id="userName" placeholder="Benutzername" required />
						<label for="userName"></label>
					</div>
					<div>
						<label for="password">Passwort:</label>
						<input type="password" name="password" id="password" required />
						<label for="password"></label>
					</div>
					<div>
						<button type="submit" name="action" value="login">Anmelden</button>
					</div>
					<p>(*) = Eingabe erforderlich</p>
				</form>
				<a href="register.jsp">Registrieren</a>
			</fieldset>
			<div>Highscore Tabelle</div>
<%@ include file="footer.jspf" %>