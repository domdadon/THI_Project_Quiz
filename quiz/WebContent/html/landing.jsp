<%@ include file="header.jspf" %>
	<div class="grid">
		<aside>
			<div class="getUser" id="getUser">Hallo ${UserData.vname} ${UserData.nname}</div><p>
			<form action="../quizmanagement" id="navigation" method="post">
						<button type="submit" class="navigation" id="navigation" name="action" value="personal">Persönliche Daten</button><p>
						<button type="submit" class="navigation" id="navigation" name="action" value="statistik">Statistik</button><p>
						<button type="submit" class="navigation" id="navigation" name="action" value="logout">Abmelden</button>
			</form>
		</aside>
		<section>
			<article>
				<div>Deine Punkte im letzten Spiel: xxx</div>
				<br>
				<div>Deine aktuelle Platzierung ist: xxx</div>
				<br>
				<div>Wählen Sie den gewünschten Schwierigkeitsgrad aus:</div>
				
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
					<div class="highscore">Highscore Tabelle</div>
		</aside>
	</div>
<%@ include file="footer.jspf" %>