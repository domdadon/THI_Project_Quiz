<%@ include file="header.jspf" %>
			<div class="grid">
				<aside>
					<div class="navigation">
						<form action="../quizmanagement" id="navigation" method="post">
									<button type="submit" class="navigation" id="empty1" disabled="disabled"></button><p>
									<button type="submit" class="navigation" id="empty2" disabled="disabled"></button><p>
									<button type="submit" class="navigation" id="empty3" disabled="disabled"></button><p>
									<button type="submit" class="navigation" id="empty4" disabled="disabled"></button>
						</form>
					</div>
				</aside>
				<section>
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
							<div class="button">
								<button type="submit" class="quiz" id="login" name="action" value="login" disabled="disabled">Anmelden</button>
							</div>
						</form>
						<p>
						<div class="register">oder <a href="register.jsp">Registrieren</a></div>
					</fieldset>
				</section>
				<aside class="sidebar">
					<div class="highscore">Highscore Tabelle<p>
						<table class="highscore">
							<tr>
								<th>Platz</th>
								<th>Benutzername</th>
								<th>Punkte</th>
						 	</tr>
							<c:forEach items="${HighScore}" var="HighscoreEntryBean">
								<tr>
									<td>${HighscoreEntryBean.rank}</td>
									<td>${HighscoreEntryBean.username}</td>
									<td>${HighscoreEntryBean.score}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</aside>
			</div>
			<script type="text/javascript" src="../js/login.js"></script>
<%@ include file="footer.jspf" %>