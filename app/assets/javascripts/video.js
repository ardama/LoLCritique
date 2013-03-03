$(document).ready( function() {

	//sets aspect ratio of video player
	width = $('#video-player').width();
	height = width*9.0/16.0;
	$('#video-player').height(height);

	//sets widths of video info tables
	width = $('#video-info').width();
	width = width - 50;
	$('#table-info').width(.35*width);
	$('#table-description').width(.65*width);

	//sets width of critique container
	width = $('#critique-container').width();
	$('#critique_comment').width(width-14);

	//sets height of critique container to match video container
	height = $('#video-container').height() + $('#video-info').height();
	$('#critique-container').height(height-20);

	//sets height of critique textarea to match video player
	$('#critique_comment').height($('#video-player').height());

	
});

window.onresize = function() {
	width = $('#video-player').width();
	height = width*9.0/16.0;
	$('#video-player').height(height);

	width = $('#video-info').width();
	width = width - 50;
	$('#table-info').width(.35*width);
	$('#table-description').width(.65*width);

	width = $('#critique-container').width();
	$('#critique_comment').width(width-14);
};