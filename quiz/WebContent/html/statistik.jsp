<%@ include file="header.jspf" %>
			<form action="../quizmanagement" id="navigation" method="post">
				<button type="submit" class="personal" id="personal" name="action" value="personal">Persönliche Daten</button><p>
				<button type="submit" class="empty2" id="empty2" disabled="disabled"></button><p>
				<button type="submit" class="quiz" id="quiz" name="action" value="checkLandingOrGame">Quiz</button><p>
				<button type="submit" class="logout" id="logout" name="action" value="logout">Abmelden</button>
			</form>
			<div class="quiz">
				<div class="formhead">Ihre Statistik</div>
				<hr>
				<p>
				<div class="personalhead">Platzierung:</div>${UserData.currentRank}<p>
				<div class="personalhead">Anzahl Spiele Gesamt:</div>${UserData.gamesPlayed}<p>
				<div class="personalhead">Anzahl Spiele leicht:</div>${UserData.gamesPlayedEasy}<p>
				<div class="personalhead">Anzahl Spiele mittel:</div>${UserData.gamesPlayedMiddle}<p>
				<div class="personalhead">Anzahl Spiele schwer:</div>${UserData.gamesPlayedHard}<p>
				<div class="personalhead">Punkte Gesamt:</div>${UserData.totalScore}<p>
				<div class="personalhead">Quote richtige Antworten:</div>${UserData.quoteAnswers}%<p>
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
