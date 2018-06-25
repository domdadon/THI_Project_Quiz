<%@ include file="header.jspf" %>

	<article>
		<h2>Wählen Sie den gewünschten Schwierigkeitsgrad aus:</h2>
		
		<form action="/thi-quiz-war/quizmanagement" id="xxx" method="post">
			<div>
				<button type="submit" name="action" value="login">leicht</button>
			</div>
			<div>
				<button type="submit" name="action" value="login">mittel</button>
			</div>
			<div>
				<button type="submit" name="action" value="login">schwer</button>
			</div>
			<p>(*) = Eingabe erforderlich</p>
		</form>
		
		
	</article>
	
	<div>Highscore Tabelle</div>
			
<%@ include file="footer.jspf" %>