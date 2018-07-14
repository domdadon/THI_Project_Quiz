"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;
function init() {
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
	xmlhttp.onreadystatechange = response;
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function response() {
	console.log("response checkUsername executed");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			document.getElementById("userName").className = "userExisting";
			console.log("change class to userExisting executed");
		} else {
			document.getElementById("userName").className = "userName";
			document.log("change class reset executed");
		}	
	}
}