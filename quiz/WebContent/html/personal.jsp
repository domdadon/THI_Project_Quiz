<%@ include file="header.jspf" %>
	<div class="grid">
		<aside><a href="./personal.jsp">Persönliche Daten</a></aside>
		<section>
			<fieldset>
				<div class="formhead">Ihre Daten</div>
				<hr>
				<p>
				<div>Nachname: ${UserData.nname}</div>
				<div>Vorname: ${UserData.vname}</div>
				<div>Benutzername: ${UserData.user}</div>
				<div>Vorname: ${UserData.mail}</div>
				<div>Punkte Gesamt: x</div>
				<div>Anzahl Spiele: x</div>
				<div>Quote richtige Antworten: x%</div>
			</fieldset>
		</section>
		<aside class="sidebar">
					<div class="highscore">Highscore Tabelle</div>
		</aside>
	</div>
<%@ include file="footer.jspf" %>
