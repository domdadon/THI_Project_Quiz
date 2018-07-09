"use strict";
document.addEventListener("DOMContentLoaded", init);

var xmlhttp;
var element;
var width;
var answer1 = document.getElementById("answer1");
var answer2 = document.getElementById("answer2");
var answer3 = document.getElementById("answer3");
var answer4 = document.getElementById("answer4");
var nextQuestion = document.getElementById("nextQuestion");

function init() {
	console.log("init executed");
	console.log("EventListener click executed");
	answer1.addEventListener("click", checkAnswer);
	answer2.addEventListener("click", checkAnswer);
	answer3.addEventListener("click", checkAnswer);
	answer4.addEventListener("click", checkAnswer);
	console.log("EventListener click successful");
	progressbar();
}


function checkAnswer(event) {
	console.log("checkAnswer executed");
	var q_ID = document.getElementById("question").dataset.questionid;
	var a_ID = event.target.dataset.answerid;
	element = event.target;
	var par = "action=setAnswer&question="+q_ID+"&answer="+a_ID;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
	width=100;
	console.log("checkAnswer successful");
}

function progressbar() {
	console.log("progress executed");
	var elem = document.getElementById("myBar");   
	width = 0;
	var id = setInterval(frame, 100);
	function frame() {
		if (width >= 100) {
			clearInterval(id);
			noAnswer();
			} else {
			width++; 
			elem.style.width = width + '%';
			elem.innerHTML = Math.round(width * 1/10)  + 'sek';
			}
		}
	console.log("progress successful");
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
	console.log("responseNoAnswer executed");
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		console.log("Buttons answer disablen");
		answer1.setAttribute("disabled", "disabled");
		answer2.setAttribute("disabled", "disabled");
		answer3.setAttribute("disabled", "disabled");
		answer4.setAttribute("disabled", "disabled");
		console.log("Button nextQuestion enablen");
		nextQuestion.removeAttribute("disabled", "disabled");
	}
	console.log("responseNoAnswer successful");
}

function response() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		if (xmlhttp.responseText == "true") {
			element.className = "answerTrue";
		} else {
			element.className = "answerFalse";
		}
		console.log("buttons disablen");
		answer1.setAttribute("disabled", "disabled");
		answer2.setAttribute("disabled", "disabled");
		answer3.setAttribute("disabled", "disabled");
		answer4.setAttribute("disabled", "disabled");
		nextQuestion.removeAttribute("disabled", "disabled");
	}
}