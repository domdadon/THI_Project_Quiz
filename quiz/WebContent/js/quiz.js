"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;
function init() {
	document.getElementById("answer1").addEventListener("click", checkAnswer);
	document.getElementById("answer2").addEventListener("click", checkAnswer);
	document.getElementById("answer3").addEventListener("click", checkAnswer);
	document.getElementById("answer4").addEventListener("click", checkAnswer);
}

function checkAnswer() {
	//var source = event.target.id;
	var source = document.getElementById("a_ID1").id;
	var q_ID = document.getElementById("q_ID").value;
	var a_ID;
	
	if (source == "answer1") {
			a_ID = document.getElementById("a_ID1").value;
	} else if (source == "answer2") {
			a_ID = document.getElementById("a_ID2").value;
	} else if (source == "answer3") {
			a_ID = document.getElementById("a_ID3").value;
	} else if (source == "answer4") {
			a_ID = document.getElementById("a_ID4").value;
	}
	
	//element = event.target;
	element = document.getElementById("a_ID1");
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = response;
	xmlhttp.open("GET", "../quizmanagement", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send("action=setAnswer&question="+q_ID+"&answer="+a_ID);
}

function response() {
	//var xmlhttp = new XMLHttpRequest();
	//if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	//	element.className = "newcolor";
	//}
	element.className = "newcolor";
}