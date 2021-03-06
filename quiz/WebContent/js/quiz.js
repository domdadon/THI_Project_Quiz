"use strict";
document.addEventListener("DOMContentLoaded", init);

var id;
var xmlhttp = null;
var element;
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
	console.log("start clearInterval");
	clearInterval(id); /*progressbar stoppen*/
	console.log("checkAnswer executed");
	var q_ID = document.getElementById("question").dataset.questionid; /*Attribut questionid beim Button hinzufügen*/
	var a_ID = event.target.dataset.answerid;
	element = event.target; /* Speichern welcher Button wurde gedrückt*/
	var par = "action=setAnswer&question="+q_ID+"&answer="+a_ID;
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
	console.log("checkAnswer successful");
}

/* ANFANG Code aus dem Internet
 * URL: https://www.w3schools.com/howto/howto_js_progressbar.asp
 */
function progressbar() {
	console.log("progress executed");
	var elem = document.getElementById("myBar");   
	var width = 0;
	id = setInterval(frame, 100);
	function frame() {
		if (width >= 100) {
			clearInterval(id);
			noAnswer();
			} else {
			width++; 
			elem.style.width = width + '%';
			}
		}
	console.log("progress successful");
}
/* ENDE Code aus dem Internet */

function noAnswer() {
	var q_ID = document.getElementById("question").dataset.questionid;
	var par = "action=setAnswer&question="+q_ID+"&answer="+0;
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = responseNoAnswer;
	xmlhttp.open("POST", "../quizmanagement", true);
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
			console.log("Answer True");
		} else {
			element.className = "answerFalse";
			console.log("Answer False");
		}
		console.log("buttons disablen");
		answer1.setAttribute("disabled", "disabled");
		answer2.setAttribute("disabled", "disabled");
		answer3.setAttribute("disabled", "disabled");
		answer4.setAttribute("disabled", "disabled");
		nextQuestion.removeAttribute("disabled", "disabled");
	}
}