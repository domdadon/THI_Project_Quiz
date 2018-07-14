"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp;

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
	xmlhttp.onreadystatechange = responseCheckUsername;
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function responseCheckUsername() {
	console.log("start response checkUsername");
	
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		
		if (xmlhttp.responseText == "true") {
			document.getElementById("userName").className = "userName";
			console.log("change class to userExisting");
		} else if (xmlhttp.responseText == "false") {
			document.getElementById("userName").className = "userNotExisting";
			console.log("change class userNotExisting");
		}	
	}
	console.log("response checkUsername successfull");
}