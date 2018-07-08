<%@ include file="header.jspf" %>
	<aside>
			<div class="navigation">
				<form action="../quizmanagement" id="navigation" method="post">
							<button type="submit" class="navigation" id="personal" name="action" value="personal">Persönliche Daten</button><p>
							<button type="submit" class="navigation" id="statistik" name="action" value="statistik">Statistik</button><p>
							<button type="submit" class="navigation" id="empty3" disabled="disabled"></button><p>
							<button type="submit" class="navigation" id="logout" name="action" value="logout">Abmelden</button>
				</form>
			</div>
	</aside>
	<section>
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
	<script type="text/javascript" src="../js/quiz.js"></script>
<%@ include file="footer.jspf" %>
