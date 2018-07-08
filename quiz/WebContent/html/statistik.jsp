<%@ include file="header.jspf" %>
	<div class="grid">
		<aside>
			<div class="navigation">
				<form action="../quizmanagement" id="navigation" method="post">
							<button type="submit" class="navigation" id="personal" name="action" value="personal">Persönliche Daten</button><p>
							<button type="submit" class="navigation" id="empty2" disabled="disabled"></button><p>
							<button type="submit" class="navigation" id="quiz" name="action" value="landing">Quiz</button><p>
							<button type="submit" class="navigation" id="logout" name="action" value="logout">Abmelden</button>
				</form>
			</div>
		</aside>
		<section>
			<article>
				<div class="formhead">Ihre Statistik</div>
				<hr>
				<p>
				<div class="personalhead">Platzierung:</div>y<p>x
				<div class="personalhead">Anzahl Spiele Gesamt:</div>y<p>
				<div class="personalhead">Anzahl Spiele leicht:</div>y<p>
				<div class="personalhead">Anzahl Spiele mittel:</div>y<p>
				<div class="personalhead">Anzahl Spiele schwer:</div>y<p>
				<div class="personalhead">Punkte Gesamt:</div>y<p>				
				<div class="personalhead">Quote richtige Antworten:</div>x%<p>
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
