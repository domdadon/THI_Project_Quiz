<%@ include file="header.jspf" %>
		<div class="navigation">
			<form action="../quizmanagement" id="navigation" method="post">
					<button type="submit" class="navigation" id="empty1" disabled="disabled"></button><p>
					<button type="submit" class="navigation" id="statistik" name="action" value="statistik">Statistik</button><p>
					<button type="submit" class="navigation" id="quiz" name="action" value="getNextQuestion">Quiz</button><p>
					<button type="submit" class="navigation" id="logout" name="action" value="logout">Abmelden</button>
			</form>
		</div>
			<div class="quiz">
				<div class="formhead">Ihre gespeicherten Daten</div>
				<hr>
				<p>
				<div class="personalhead">Nachname:</div>${UserData.nname}<p>
				<div class="personalhead">Vorname:</div>${UserData.vname}<p>
				<div class="personalhead">Benutzername:</div> ${UserData.user}<p>
				<div class="personalhead">E-Mailadresse:</div> ${UserData.mail}<p>
			</div>
		
		
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
<%@ include file="footer.jspf" %>
