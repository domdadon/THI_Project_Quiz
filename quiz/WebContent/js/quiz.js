"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp = null;
function init() {
	document.getElementById("answer1").addEventListener("click", function(){checkAnswer(event);});
	document.getElementById("answer2").addEventListener("click", function(){checkAnswer(event);});
	document.getElementById("answer3").addEventListener("click", function(){checkAnswer(event);});
	document.getElementById("answer4").addEventListener("click", function(){checkAnswer(event);});
}


function checkAnswer(event) {
	var source = event.target.id
	//var source = document.getElementById("a_ID1").id;
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
	
	element = event.target;
	
	var par = "action=setAnswer&question="+q_ID+"&answer="+a_ID
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "../quizmanagement", true);
	xmlhttp.onreadystatechange = response;
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(par);
}

function response() {
	//var xmlhttp = new XMLHttpRequest();
	//if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	//	element.className = "newcolor";
	//}
	console.log("reached");
	element.className = "newcolor";
}