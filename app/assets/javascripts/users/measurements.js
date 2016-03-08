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
	$('#user_measurement_hips').on('click', displayMeasurementPic)
	$('#user_measurement_shoulders').on('click', displayMeasurementPic)
	$('#user_measurement_inseam').on('click', displayMeasurementPic)
	$('#user_measurement_bust').on('click', displayMeasurementPic)
	$('#user_measurement_waist').on('click', displayMeasurementPic)
	$('#user_measurement_chest').on('click', displayMeasurementPic)
}

var displayMeasurementPic = function(){
 
  	event.preventDefault();
  	var targeted = $(this);
  	$(".measurement-image").hide();
  	targeted.parent().children(".measurement-image").show();

  	// targeted.parent().append("<img src='/assets/images/hips.png'");
  	//This comment will be DELETED//

};
