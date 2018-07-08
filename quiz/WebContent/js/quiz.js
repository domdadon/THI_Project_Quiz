"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp;
function init() {
	document.getElementById("answer1").addEventListener("click", checkAnswer);
	document.getElementById("answer2").addEventListener("click", checkAnswer);
	document.getElementById("answer3").addEventListener("click", checkAnswer);
	document.getElementById("answer4").addEventListener("click", checkAnswer);
	progressbar();
}


function checkAnswer(event) {
	var q_ID = document.getElementById("question").dataset.questionid;
	var a_ID = event.target.dataset.answerid;
		
	element = event.target;
	
	var par = "action=setAnswer&question="+q_ID+"&answer="+a_ID;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function progressbar() {
	  var elem = document.getElementById("progressbar");   
	  var width = 0;
	  var id = setInterval(frame, 100);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	      noAnswer();
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	    }
	  }
	}

function noAnswer() {
	var q_ID = document.getElementById("question").dataset.questionid;

	var par = "action=setAnswer&question="+q_ID+"&answer="+0;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = responseNoAnswer;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function responseNoAnswer() {
	
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		console.log("buttons disablen");
		document.getElementById("answer1").setAttribute("disabled", "disabled");
		document.getElementById("answer2").setAttribute("disabled", "disabled");
		document.getElementById("answer3").setAttribute("disabled", "disabled");
		document.getElementById("answer4").setAttribute("disabled", "disabled");
	}
}

function response() {
	
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			element.className = "answerTrue";
		} else {
			element.className = "answerFalse";
		}
		console.log("buttons disablen");
		document.getElementById("answer1").setAttribute("disabled", "disabled");
		document.getElementById("answer2").setAttribute("disabled", "disabled");
		document.getElementById("answer3").setAttribute("disabled", "disabled");
		document.getElementById("answer4").setAttribute("disabled", "disabled");
	}
}