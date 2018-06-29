document.addEventListener("DOMContentLoaded", init);
function init() {
	console.log("init executed");
	document.getElementById("register").addEventListener("click", gotoregister);
	
}

function gotoregister() {
	location.href='../html/register.jsp';
}