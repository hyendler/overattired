// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




// Logic for measurement showing
// If the value of female/male is null
//    hide all until female/male is clicked
// else (the value of male or female exists)
//    show the appropriate fields
// end
// 
// 
// 
// 

$(document).ready(function() {
  $('#radio-show-bust').hide();
  $('#radio-show-hips').hide();
  $('#radio-show-chest').hide();
  $('#radio-show-waist').hide();
  $('#radio-show-inseam').hide();
  
  bindListeners();

  if ($('#show-male > input').prop("checked")) {
    displayMaleMeasurements();
  } else {
    displayFemaleMeasurements();
  }
});


var bindListeners = function(){
  
  $('#show-male').on('click', displayMaleMeasurements)
  $('#show-female').on('click', displayFemaleMeasurements)
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

var displayMaleMeasurements = function(){
    $('#radio-show-waist').show();
    $('#radio-show-chest').show();
    $('#radio-show-inseam').show();
    $('#radio-show-bust').hide();
    $('#radio-show-hips').hide();
};

var displayFemaleMeasurements = function(){
  $('#radio-show-waist').show();
  $('#radio-show-bust').show();
  $('#radio-show-hips').show();
  $('#radio-show-chest').hide();
  $('#radio-show-inseam').hide();
};
