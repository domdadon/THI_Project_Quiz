<%@ include file="header.jspf" %>
	<div class="grid">
		<aside>
			<div class="navigation">
				<form action="../quizmanagement" id="navigation" method="post">
							<button type="submit" class="navigation" id="personal" name="action" value="personal">Pers�nliche Daten</button><p>
							<button type="submit" class="navigation" id="statistik" name="action" value="statistik">Statistik</button><p>
							<button type="submit" class="navigation" id="empty3" disabled="disabled"></button><p>
							<button type="submit" class="navigation" id="logout" name="action" value="logout">Abmelden</button>
				</form>
			</div>
		</aside>
		<section>
			<article>
				<div>Deine Punkte im letzten Spiel: xxx</div>
				<br>
				<div>Deine aktuelle Platzierung ist: xxx</div>
				<br>
				<div>W�hlen Sie den gew�nschten Schwierigkeitsgrad aus:</div>
				
				<form action="../quizmanagement" id="landingForm" method="post">
					<div class="start">
						<div>
							<button type="submit" class="startGame" name="action" value="startGame1">leicht<br>&#040;2 Punkte pro richtige Antwort&#041;</button>
						</div>
						<div>
							<button type="submit" class="startGame" name="action" value="startGame2">mittel<br>&#040;4 Punkte pro richtige Antwort&#041;</button>
						</div>
						<div>
							<button type="submit" class="startGame" name="action" value="startGame3">schwer<br>&#040;6 Punkte pro richtige Antwort&#041;</button>
						</div>
					</div>
				</form>		
			</article>
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
<%@ include file="footer.jspf" %>