<%@ include file="header.jspf" %>

	<article>
		<div>Deine Punkte im letzten Spiel: xxx</div>
		<br>
		<div>Deine aktuelle Platzierung ist: xxx</div>
		<br>
		<div>W�hlen Sie den gew�nschten Schwierigkeitsgrad aus:</div>
		
		<form action="../quizmanagement" id="landingForm" method="post">
			<div>
				<button type="submit" name="action" value="startGame1">leicht</button>
			</div>
			<div>
				<button type="submit" name="action" value="startGame2">mittel</button>
			</div>
			<div>
				<button type="submit" name="action" value="startGame3">schwer</button>
			</div>
		</form>
		
		
	</article>
	
	<div>Highscore Tabelle</div>
			
<%@ include file="footer.jspf" %>