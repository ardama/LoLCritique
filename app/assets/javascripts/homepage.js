
$(document).ready( function() {
	$('#tab_1 a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	});
	$('#tab_2 a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	});
	$('#tab_3 a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	});

	var champArray = new Array( 
		"Ahri", "Akali", "Alistar", "Amumu", "Anivia", "Annie", "Ashe",
		"Blitzcrank", "Brand", "Caitlyn", "Cassiopeia", "Cho'gath", "Corki", "Dr. Mundo",
		"Evelynn", "Ezreal", "Fiddlesticks", "Fiora", "Fizz", "Galio", "Gangplank", "Garen", 
		"Gragas", "Graves", "Hecarim", "Heimerdinger", "Irelia", "Janna", "Jarvan IV", "Jax", 
		"Karma", "Karthus", "Kassadin", "Katarina", "Kayle", "Kennen", "Kog'Maw", "LeBlanc", 
		"Lee Sin", "Leona", "Lulu", "Lux", "Malphite", "Malzahar", "Maokai", "Master Yi", 
		"Miss Fortune", "Mordekaiser", "Morgana", "Nasus", "Nautilus", "Nidalee", "Nocturne", 
		"Nunu", "Olaf", "Orianna", "Pantheon", "Poppy", "Rammus", "Renekton", "Riven", "Rumble", 
		"Ryze", "Sejuani", "Shaco", "Shen", "Shyvana", "Singed", "Sion", "Sivir", "Skarner", 
		"Sona", "Soraka", "Swain", "Talon", "Taric", "Teemo", "Tristana", "Trundle", "Trydamere", 
		"Twisted Fate", "Twitch", "Udyr", "Urgot", "Varus", "Vayne", "Veigar", "Viktor", 
		"Vladimir", "Volibear", "Warwick", "Wukong", "Xerath", "Xin Zhao", "Yorick", "Ziggs", "Zilean"
		);
	var positionArray = new Array(
		"Top Lane", "Mid Lane", "Jungle", "Bot Lane - ADC", "Bot Lane - Support"
		);
	var phaseArray = new Array(
		"Early/Laning", "Middle/Roaming", "Late/Teamfighting"
		);
	var focusArray = new Array(
		"Last Hitting", "Zoning", "Harassing", "Warding", "Item Builds", "Invading", "Ganking", "Roaming", 
		"Map Awareness", "Teamfighting", "Positioning", "Taking Objectives", "Initiating", "Tanking",
		"Kiting", "Focusing", "Matchups"
		);

	populateOptions('.filter-dropdown-1',champArray);
	populateOptions('.filter-dropdown-2',positionArray);
	populateOptions('.filter-dropdown-3',phaseArray);
	populateOptions('.filter-dropdown-4',focusArray);

	$('.filter-dropdown-1').multiselect({minWidth:'auto', header:false, multiple:false, selectedList:1});	
	$('.filter-dropdown-2').multiselect({minWidth:'auto', header:false, multiple:false, selectedList:1, height:'auto'});	
	$('.filter-dropdown-3').multiselect({minWidth:'auto', header:false, multiple:false, selectedList:1, height:'auto'});	
	$('.filter-dropdown-4').multiselect({minWidth:'auto', header:false, selectedList: 1, noneSelectedText: "-- Select Focus Points --"});	

//	$('.filter-dropdown-1').chosen({allow_single_deselect:true});
//	$('.filter-dropdown-2').chosen({allow_single_deselect:true, disable_search:true});
//	$('.filter-dropdown-3').chosen({allow_single_deselect:true, disable_search:true});
//	$('.filter-dropdown-4').chosen({allow_single_deselect:true});



	$("#video-filters").submit(function() {
		    $.get(this.action, $(this).serialize(), null, "script");
		    return false;
		  });
	$('.filter-dropdown-1').bind('multiselectclose', function(event, ui){
		$.getScript('app/assets/views/layouts/index.js.erb');
//		alert('here');
		return false;
	});

});


function populateOptions(element, optionArray) {

	for (var i = 0; i < optionArray.length; i++) {
		var newOption = "<option>" + optionArray[i] + "</option>";
		$(element).append(newOption);
	}
}
