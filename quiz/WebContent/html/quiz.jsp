<%@ include file="header.jspf" %>
	<article>
		<div class="grid">
			<div class="currentQuestion">Frage ${QuestionBean.q_Number}/10</div>
			<p>
			<div class="progressbar">Progressbar</div>
			<p>
			<div class="numberOfPoints">Aktuelle Punkte x</div>
			<p>
		</div>
		<p>
		<div class="question" id="question" data-questionid="${QuestionBean.qID}">${QuestionBean.q}?</div>
		<div class="answers">
			<form action="../quizmanagement" id="quizForm" method="post">
				<button type="button" class="answer" name="action" value="setAnswer" id="answer1" data-answerid="${QuestionBean.a_ID1}">${QuestionBean.a_1}</button>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer2" data-answerid="${QuestionBean.a_ID2}">${QuestionBean.a_2}</button>
				<br>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer3" data-answerid="${QuestionBean.a_ID3}">${QuestionBean.a_3}</button>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer4" data-answerid="${QuestionBean.a_ID4}">${QuestionBean.a_4}</button>
				<div class="nextQuestion">
					<button type="submit" class="nextQuestion" name="action" value="getNextQuestion" id="nextQuestion">weiter</button>
				</div>
			</form>
		</div>		
	</article>
	<script type="text/javascript" src="../js/quiz.js"></script>
<%@ include file="footer.jspf" %>
