<%@ include file="header.jspf" %>
	<div class="grid">
		<aside><a href="./personal.jsp">Pers�nliche Daten</a></aside>
		<section>
			<fieldset>
				<div class="formhead">Ihre Daten</div>
				<hr>
				<p>
				<div>Nachname: ${UserBean.nname}</div>
				<div>Vorname: ${UserBean.vname}</div>
				<div>Benutzername: ${UserBean.user}</div>
				<div>Vorname: ${UserBean.mail}</div>
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
