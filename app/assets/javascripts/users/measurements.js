// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// $(document).ready(function() {
//   measurementPicListener();
// });


// var measurementPicListener = function(){
//   $('#measurement_hips').on('click', function(event){
//   	event.preventDefault();

//   	var target = $(this)

//   	$('#measurement-image').append("<img src='/assets/images/hips.png'>")

//   })
  	

// };


$(document).ready(function() {
  bindListeners();
});


var bindListeners = function(){
	$('#measurement_hips').on('click', displayMeasurementPic)
	$('#measurement_shoulders').on('click', displayMeasurementPic)
	$('#measurement_inseam').on('click', displayMeasurementPic)
	$('#measurement_bust').on('click', displayMeasurementPic)
	$('#measurement_waist').on('click', displayMeasurementPic)
	$('#measurement_chest').on('click', displayMeasurementPic)
}

var displayMeasurementPic = function(){
 
  	event.preventDefault();
  	var targeted = $(this);
  	$(".measurement-image").hide();
  	targeted.parent().children(".measurement-image").show();

  	// targeted.parent().append("<img src='/assets/images/hips.png'");
  	

};
