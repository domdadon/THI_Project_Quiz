<%@ include file="header.jspf" %>
			<fieldset>
				<form action="../quizmanagement" id="loginForm" method="post">
					<div class="formhead">Registrierung</div>
					<hr>
					<p>
					<div>
						<label for="vName">Vorname:</label>
						<input type="text" name="vName" id="vName" class="vName" placeholder="Max" required="required" autofocus="autofocus"/>
						<label for="vName"></label>
					</div>
					<div>
						<label for="nName">Nachname:</label>
						<input type="text" name="nName" id="nName" class="nName" placeholder="Mustermann" required="required" />
						<label for="nName"></label>
					</div>
					<div>
						<label for="mail">E-Mail:</label>
						<input type="email" name="mail" id="mail" class="mail" placeholder="example@example.net" required="required" />
						<label for="mail"></label>
					</div>
					<div>
						<label for="userName">Benutzername:</label>
						<input type="text" name="userName" id="userName" class="userName" placeholder="MaxMustermann" required="required" />
						<label for="userName"></label>
					</div>
					<div>
						<label for="password">Passwort:</label>
						<input type="password" name="password" id="password" class="password" required="required" />
						<label for="password"></label>
					</div>
					<div class="inputrequired">* Pflichtfeld</div>
					<p>
					<div class="button">
						<button type="submit" name="action" value="register" class="register">Registrieren</button>
					</div>
					
				</form>
					<p>
					<div class="login"><a href="login.jsp">zurück zum Login</a></div>
			</fieldset>
			<aside class="sidebar">
				<div class="highscore">Highscore Tabelle</div>
			</aside>
			<script type="text/javascript" src="../js/register.js"></script>
<%@ include file="footer.jspf" %>