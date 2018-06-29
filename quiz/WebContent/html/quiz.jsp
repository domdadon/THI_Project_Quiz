<%@ include file="header.jspf" %>
	<article>
		<div>Frage x/x</div>
		<div>Progressbar</div>
		<div>Punkte x</div>
		
		
		<div>${QuestionBean.q}</div>
				
		<form action="../quizmanagement" id="quizForm" method="post">
			<div>
				<button type="submit" name="action" value="answer1">${QuestionBean.a_1}</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer2">${QuestionBean.a_2}</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer3">${QuestionBean.a_3}</button>
			</div>
			<div>
				<button type="submit" name="action" value="answer4">${QuestionBean.a_4}</button>
			</div>
			<div>
				<button type="submit" name="action" value="nextQuestion">weiter</button>
			</div>
			
		</form>
		
	</article>
				
<%@ include file="footer.jspf" %>