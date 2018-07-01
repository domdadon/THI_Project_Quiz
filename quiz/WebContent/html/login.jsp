<%@ include file="header.jspf" %>
			<fieldset><legend>Login</legend>
				<form action="../quizmanagement" id="loginForm" method="post">
					<div class="form">
						<label for="userName">Ihr Benutzername:</label>
						<br>
						<input type="text" name="userName" id="userName" class="userName" placeholder="Benutzername" required="required" autofocus="autofocus"/>
						<label for="userName"></label>
					</div>
					<div class="form">
						<label for="password">Ihr Passwort:</label>
						<br>
						<input type="password" name="password" id="password" class="password" placeholder="Passwort" required="required" />
						<label for="password"></label>
					</div>
					<div class="inputrequired">* Pflichtfeld</div>
					<p>
					<div class="button">
						<button type="submit" name="action" value="login">Anmelden</button>
					</div>
				</form>
				<p>
				<div class="register">oder <a href="register.jsp">Registrieren</a></div>
			</fieldset>
			<div class="highscore">Highscore Tabelle</div>
			<script type="text/javascript" src="../js/login.js"></script>
<%@ include file="footer.jspf" %>