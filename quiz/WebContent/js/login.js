"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;

function init() {
	console.log("start init");
	console.log("start EventListener keyup");
	document.getElementById("userName").addEventListener("keyup", checkUsername);
	console.log("EventListener keyup successful");
	console.log("start remove GetUser");
	document.getElementById("getUser").remove();
	console.log("GetUser successful");
}

function checkUsername() {
	console.log("start function checkUsername");
	var username = document.getElementById("userName").value; 
	var par = "action=checkUsername&userName="+username;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = responseCheckUsername;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function responseCheckUsername() {
	console.log("start response checkUsername");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			document.getElementById("userName").className = "userName";
			document.getElementById("login").removeAttribute("disabled", "disabled");
			console.log("change class to userExisting");
		} else if (xml.http.responsteText == "false") {
			document.getElementById("userName").className = "userNotExisting";
			document.getElementById("login").setAttribute("disabled", "disabled");
			console.log("change class userNotExisting");
		}	
	}
}