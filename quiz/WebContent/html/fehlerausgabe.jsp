<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="${pageContext.request.requestURI}" />
		<meta name="author" content="Dominik Mueller, Daniel Reiss, Harald Schwirzenbeck">
		<title>Fehlerseite</title>
	</head>
	<body>
		<h1>Fehlerseite</h1>
		Es ist ein Fehler aufgetreten.<br>
		<br>
		<b>Die Fehlermeldung lautet:</b>
		<br>
		${pageContext.exception}
		<br><br>
		<h3>Stack trace:</h3>
		<c:forEach var = "trace" items = "${pageContext.exception.stackTrace}">
			<p>${trace}</p>
		</c:forEach>
	</body>
</html>