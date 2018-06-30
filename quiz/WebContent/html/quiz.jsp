<%@ include file="header.jspf" %>
	<article>
		<div>Frage x/x</div>
		<div>Progressbar</div>
		<div>Punkte x</div>
		
		
		<div>${QuestionBean.q}?</div>
				
		<form action="../quizmanagement" id="quizForm" method="post">
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer1">${QuestionBean.a_1}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer2">${QuestionBean.a_2}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer3">${QuestionBean.a_3}</button>
			</div>
			<div>
				<button type="button" class="answer" name="action" value="setAnswer" id="answer4">${QuestionBean.a_4}</button>
			</div>
			<div>
				<button type="submit" name="action" value="nextQuestion" id="nextQuestion">weiter</button>
			</div>
			<input type="text" id="q_ID" name="qID" value=${QuestionBean.qID} hidden>
			<input type="text" id="a_ID1" name="aID1" value=${QuestionBean.a_ID1} hidden>
			<input type="text" id="a_ID2" name="aID2" value=${QuestionBean.a_ID2} hidden>
			<input type="text" id="a_ID3" name="aID3" value=${QuestionBean.a_ID3} hidden>
			<input type="text" id="a_ID4" name="aID4" value=${QuestionBean.a_ID4} hidden>
		</form>
		
	</article>
	<script type="text/javascript" src="../js/quiz.js"></script>
<%@ include file="footer.jspf" %>