"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;

function init() {
	console.log("init executed");
	console.log("EventListener keyup executed");
	document.getElementById("userName").addEventListener("keyup", checkUsername);
	console.log("EventListener keyup successful");
	console.log("removeChild executed");
	document.getElementById("getUser").remove();
	console.log("removeChild successful");
}

function checkUsername() {
	console.log("function checkUsername executed");
	var username = document.getElementById("userName").value; 
	var par = "action=checkUsername&userName="+username;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = responseCheckUsername;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function responseCheckUsername() {
	console.log("response checkUsername executed");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			document.getElementById("userName").className = "userName";
			document.getElementById("login").removeAttribute("disabled", "disabled");
			console.log("change class to userExisting executed");
		} else {
			document.getElementById("userName").className = "userNotExisting";
			document.getElementById("login").setAttribute("disabled", "disabled");
			console.log("change class reset executed");
		}	
	}
}