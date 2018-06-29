<%@ include file="header.jspf" %>
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
						<!-- <button type="submit" name="action" value="registerForm">Registrieren</button>-->
						
						<!-- über Javascript aufgrund Performance -->
						<button onclick="location.href='register.jsp'" type="submit">Registrieren</button>
					</div>
					<p>(*) = Eingabe erforderlich</p>
				</form>
			</fieldset>
			<div>Highscore Tabelle</div>
<%@ include file="footer.jspf" %>