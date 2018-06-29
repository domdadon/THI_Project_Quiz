<%@ include file="header.jspf" %>
	<article>
		<div>Frage x/x</div>
		<div>Progressbar</div>
		<div>Punkte x</div>
		<div>Schwierigkeitsgrad x</div>
		
		<div>Frage</div>
				
		<form action="/thi-quiz-war/quizmanagement" id="quizForm" method="post">
			<div>
				<button type="submit" name="action" value="answer1">Antwort 1</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer2">Antwort 2</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer3">Antwort 3</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer4">Antwort 4</button>
			</div>
			<div>
				<button type="submit" name="action" value="nextQuestion">weiter</button>
			</div>
			
		</form>
		
	</article>
				
<%@ include file="footer.jspf" %>