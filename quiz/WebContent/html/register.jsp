<%@ include file="header.jspf" %>
			<fieldset><legend>Register-Formular</legend>
				<form action="/thi-quiz-war/quizmanagement" id="loginForm" method="post">
					<div>
						<label for="vName">Vorname:</label>
						<input type="text" name="vName" id="vName" placeholder="Max" required />
						<label for="vName"></label>
					</div>
					<div>
						<label for="nName">Nachname:</label>
						<input type="text" name="nName" id="nName" placeholder="Mustermann" required />
						<label for="nName"></label>
					</div>
					<div>
						<label for="mail">E-Mail:</label>
						<input type="text" name="mail" id="mail" placeholder="example@example.net" required />
						<label for="mail"></label>
					</div>
					<div>
						<label for="userName">Benutzername:</label>
						<input type="text" name="userName" id="userName" placeholder="MaxMustermann" required />
						<label for="userName"></label>
					</div>
					<div>
						<label for="password">Passwort:</label>
						<input type="password" name="password" id="password" required />
						<label for="password"></label>
					</div>
					<div>
						<button type="submit" name="action" value="register">Registrieren</button>
						<button onclick="location.href='login.jsp'" type="submit">zur�ck zum Login</button>
					</div>
					<p>(*) = Eingabe erforderlich</p>
				</form>
			</fieldset>
			<div>Highscore Tabelle</div>
<%@ include file="footer.jspf" %>