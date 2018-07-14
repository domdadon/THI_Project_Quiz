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
			<hr>
			<br>
			<div class="difficulty">Wählen Sie den gewünschten Schwierigkeitsgrad aus:</div>
			
			<form action="../quizmanagement" id="landingForm" method="post">
				<div class="startGame">
					<div class="easy">
						<button type="submit" class="startGame" name="action" value="startGame1" title="1 Punkt pro richtiger Antwort">leicht</button>
					</div>
					<div class="medium">
						<button type="submit" class="startGame" name="action" value="startGame2" title="2 Punkte pro richtiger Antwort">mittel</button>
					</div>
					<div class="hard">
						<button type="submit" class="startGame" name="action" value="startGame3" title="3 Punkte pro richtiger Antwort">schwer</button>
					</div>
				</div>
			</form>		
		</div>
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
<%@ include file="footer.jspf" %>