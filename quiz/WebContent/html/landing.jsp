<%@ include file="header.jspf" %>
		<form action="../quizmanagement" id="navigation" method="post">
			<button type="submit" class="personal" id="personal" name="action" value="personal">Persönliche Daten</button><p>
			<button type="submit" class="statistik" id="statistik" name="action" value="statistik">Statistik</button><p>
			<button type="submit" class="empty3" id="empty3" disabled="disabled"></button><p>
			<button type="submit" class="logout" id="logout" name="action" value="logout">Abmelden</button>
		</form>
		<div class="quiz">
			<div>Deine Punkte im letzten Spiel: ${UserData.lastScore}</div>
			<br>
			<div>Deine aktuelle Platzierung: ${UserData.currentRank}</div>
			<br>
			<div>Wählen Sie den gewünschten Schwierigkeitsgrad aus:</div>
			
			<form action="../quizmanagement" id="landingForm" method="post">
				<div class="start">
					<div>
						<button type="submit" class="startGame" name="action" value="startGame1">leicht<br>&#040;1 Punkt pro richtige Antwort&#041;</button>
					</div>
					<div>
						<button type="submit" class="startGame" name="action" value="startGame2">mittel<br>&#040;2 Punkte pro richtige Antwort&#041;</button>
					</div>
					<div>
						<button type="submit" class="startGame" name="action" value="startGame3">schwer<br>&#040;3 Punkte pro richtige Antwort&#041;</button>
					</div>
				</div>
			</form>		
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