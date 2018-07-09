"use strict";
document.addEventListener("DOMContentLoaded", init);
var element;
var xmlhttp;
function init() {
	move();
}

function move() {
	console.log("move start");
	  var elem = document.getElementById("myBar");   
	  var width = 0;
	  var id = setInterval(frame, 5);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	    }
	  }
	console.log("move finish");
}