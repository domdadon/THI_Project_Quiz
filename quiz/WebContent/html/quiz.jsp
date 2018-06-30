<%@ include file="header.jspf" %>
	<article>
		<div>Frage x/x</div>
		<div>Progressbar</div>
		<div>Punkte x</div>
		
		
		<div id="question" data-questionid="${QuestionBean.qID}">${QuestionBean.q}?</div>
				
		<form action="../quizmanagement" id="quizForm" method="post">
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer1" data-answerid="${QuestionBean.a_ID1}">${QuestionBean.a_1}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer2" data-answerid="${QuestionBean.a_ID2}">${QuestionBean.a_2}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer3" data-answerid="${QuestionBean.a_ID3}">${QuestionBean.a_3}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer4" data-answerid="${QuestionBean.a_ID4}">${QuestionBean.a_4}</button>
			</div>
			<div>
				<button type="submit" name="action" value="getNextQuestion" id="nextQuestion">weiter</button>
			</div>
		</form>
		
	</article>
	<script type="text/javascript" src="../js/quiz.js"></script>
<%@ include file="footer.jspf" %>
