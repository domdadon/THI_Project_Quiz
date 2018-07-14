<%@ include file="header.jspf" %>				
				<form action="../quizmanagement" id="navigation" method="post">
					<button type="submit" class="empty1" id="empty1" disabled="disabled"></button>
					<button type="submit" class="empty2" id="empty2" disabled="disabled"></button>
					<button type="submit" class="empty3" id="empty3" disabled="disabled"></button>
					<button type="submit" class="empty4" id="empty4" disabled="disabled"></button>
				</form>
				<fieldset>
					<form action="../quizmanagement" id="loginForm" method="post">
						<div class="formhead">Login</div>
						<hr>
						<p>
						<div class="form">
							<label for="userName">Benutzername:</label>
							<input type="text" name="userName" id="userName" class="userName" placeholder="Benutzername" required="required" autofocus="autofocus"/>
							<label for="userName"></label>
						</div>
						<div class="form">
							<label for="password">Passwort:</label>
							<input type="password" name="password" id="password" class="password" placeholder="Passwort" required="required" />
							<label for="password"></label>
						</div>
						<div class="inputrequired">* Pflichtfeld</div>
						<p>
						<button type="submit" class="loginRegister" id="login" name="action" value="login">Anmelden</button>
					</form>
					<p>
					<div class="loginRegister">oder <a href="register.jsp">Registrieren</a></div>
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
			<script src="../js/login.js"></script>
<%@ include file="footer.jspf" %>