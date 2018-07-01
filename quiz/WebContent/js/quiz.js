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


function checkAnswer(event) {
	var source = event.target.id
	//var source = document.getElementById("a_ID1").id;
	var q_ID = document.getElementById("question").dataset.questionid;
	var a_ID = event.target.dataset.answerid;
		
	element = event.target;
	
	var par = "action=setAnswer&question="+q_ID+"&answer="+a_ID
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function response() {
	
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			element.className = "answerTrue";
		} else {
			element.className = "answerFalse";
		}
		document.getElementById("answer1").setAttribute("disabled");
		document.getElementById("answer2").setAttribute("disabled");
		document.getElementById("answer3").setAttribute("disabled");
		document.getElementById("answer4").setAttribute("disabled");
	}
}