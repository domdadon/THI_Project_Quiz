"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;
function init() {
	/*document.getElementById("userName").addEventListener("keyup", checkUsername);*/
	document.getElementById("userName").addEventListener("blur", checkUsername);
}


function checkUsername() {
	console.log("function checkUsername executed");
	var username = document.getElementById("userName").value; 
	var par = "action=checkUsername&userName="+username;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function response() {
	console.log("response checkUsername executed");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			document.getElementById("userName").className = "userExisting";
		} else {
			
		}
	
	}
}