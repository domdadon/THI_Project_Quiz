"use strict";
document.addEventListener("DOMContentLoaded", getUsername);

function getUsername() {
	console.log("function getUsername executed");
	var getUser = document.getElementById("getUser"); 
	var par = "getUserdata="+1;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = responseGetUsername;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
	console.log("function getUsername successful");
}

function responseGetUsername() {
	console.log("responseGetUsername executed");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			document.getElementById("getUser").nodeValue = "test";
			console.log("change nodeValue GetUsername executed");
		} else {
			document.getElementById("getUser").nodeValue = "Gast";
			console.log("change nodeValue to Guest executed");
		}	
	}
	console.log("responseGetUsername successful");
}