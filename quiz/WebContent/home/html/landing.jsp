<%@ include file="header.jspf" %>

	<article>
		<div>Deine Punkte im letzten Spiel: xxx</div>
		<br>
		<div>Deine aktuelle Platzierung ist: xxx</div>
		<br>
		<br>
		<div>Wählen Sie den gewünschten Schwierigkeitsgrad aus:</div>
		
		<form action="/thi-quiz-war/quizmanagement" id="landingForm" method="post">
			<div>
				<button type="submit" name="action" value="startGame1">leicht</button>
			</div>
			<div>
				<button type="submit" name="action" value="startGame2">mittel</button>
			</div>
			<div>
				<button type="submit" name="action" value="startGame3">schwer</button>
			</div>
			<p>(*) = Eingabe erforderlich</p>
		</form>
		
		
	</article>
	
	<div>Highscore Tabelle</div>
			
<%@ include file="footer.jspf" %>