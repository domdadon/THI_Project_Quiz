<%@ include file="header.jspf" %>
	<div class="grid">
		<aside>
			<div class="getUser" id="getUser">Hallo ${UserData.vname} ${UserData.nname}</div><p>
			<form action="../quizmanagement" id="navigation" method="post">
						<button type="submit" class="navigation" id="navigation" name="action" value="landing">Zur�ck zum Quiz</button><p>
						<button type="submit" class="navigation" id="navigation" name="action" value="logout">Abmelden</button>
			</form>
		</aside>
		<section>
			<article>
				<div class="formhead">Ihre gespeicherten Daten</div>
				<hr>
				<p>
				<div class="personalhead">Nachname:</div>${UserData.nname}<p>
				<div class="personalhead">Vorname:</div>${UserData.vname}<p>
				<div class="personalhead">Benutzername:</div> ${UserData.user}<p>
				<div class="personalhead">E-Mailadresse:</div> ${UserData.mail}<p>
				<div class="personalhead">Punkte Gesamt:</div>y<p>
				<div class="personalhead">Anzahl Spiele:</div>y<p>
				<div class="personalhead">Quote richtige Antworten:</div>x%<p>
			</article>
		</section>
		<aside class="sidebar">
					<div class="highscore">Highscore Tabelle</div>
		</aside>
	</div>
<%@ include file="footer.jspf" %>
