var site;
var page;
var arrive;
var depart;
var duration;
window.onload = function() {
	site = location.hostname;
	page = location.pathname;
	arrive = new Date();
}
window.onbeforeunload = function() {
	depart = new Date();
	duration = depart - arrive;
	duration /= 1000.0;
	var xhr = new XMLHttpRequest();
	var params = "domain="+ site + "&page=" + page + "&duration=" + duration;
	xhr.open('GET', 'http://ardama-projectone.herokuapp.com/restricted/resource?' + params, false);
	xhr.send();
}