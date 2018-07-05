<%@ include file="header.jspf" %>
	<div class="grid">
		<aside>
			<div class="getUser" id="getUser">Hallo ${UserData.vname} ${UserData.nname}</div><p>
			<form action="../quizmanagement" id="navigation" method="post">
						<button type="submit" class="navigation" id="navigation" name="action" value="landing">Zurück zum Quiz</button><p>
						<button type="submit" class="navigation" id="navigation" name="action" value="logout">Abmelden</button>
			</form>
		</aside>
		<section>
			<article>
				<div class="formhead">Ihre Statistik</div>
				<hr>
				<p>
				<div class="personalhead">Anzahl Spiele Gesamt:</div>y<p>
				<div class="personalhead">Anzahl Spiele leicht:</div>y<p>
				<div class="personalhead">Anzahl Spiele mittel:</div>y<p>
				<div class="personalhead">Anzahl Spiele schwer:</div>y<p>
				<div class="personalhead">Punkte Gesamt:</div>y<p>				
				<div class="personalhead">Quote richtige Antworten:</div>x%<p>
			</article>
		</section>
		<aside class="sidebar">
					<div class="highscore">Highscore Tabelle</div>
		</aside>
	</div>
<%@ include file="footer.jspf" %>
