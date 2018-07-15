<%@ include file="header.jspf" %>
					<form action="../quizmanagement" id="navigation" method="post">
						<button type="submit" class="empty1" id="empty1" disabled="disabled"></button><p>
						<button type="submit" class="empty2" id="empty2" disabled="disabled"></button><p>
						<button type="submit" class="empty3" id="empty3" disabled="disabled"></button><p>
						<button type="submit" class="empty4" id="empty4" disabled="disabled"></button>
					</form>
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
							<button type="submit" id="register" name="action" value="register" class="loginRegister">Registrieren</button>
						</form>
							<p>
							<div class="loginRegister">zurück zum
								<form action="../quizmanagement" id="loginRegister" method="post">
									<button type="submit" class="loginRegister" name="action" value="loginpage">Login</button>
								</form>
							</div>
					</fieldset>
					<div class="highscore">Highscore Tabelle<p>
						<table class="highscore">
							<thead>
								<tr>
									<th>Platz</th>
									<th>Benutzername</th>
									<th>Punkte</th>
							 	</tr>
							</thead>
							<tbody>	
								<c:forEach items="${HighScore}" var="HighscoreEntryBean">
								<tr>
									<td>${HighscoreEntryBean.rank}</td>
									<td>${HighscoreEntryBean.username}</td>
									<td>${HighscoreEntryBean.score}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
			<script src="../js/register.js"></script>
<%@ include file="footer.jspf" %>