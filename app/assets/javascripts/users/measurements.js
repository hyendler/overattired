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

// $(function() {
//   $('fieldset#show-female').on('change', function(event){
//     event.preventDefault();
//     $('fieldset#radio-show-hips').toggle();
//   });
// });

// $(document).ready(function(){
//   $('input[type="radio"]').on('change', function(){
//     if ( $('fieldset').attr('id') == 'show-female') {
//       console.log("I'm here");
//       $('#radio-show-hips').show();
//       console.log("I'm at the hips");
//       $('#radio-show-waist').show();
//       $('#radio-show-bust').show();
//       console.log("I'm at hiding things");
//       $('#radio-show-chest').hide();
//       $('#radio-show-inseam').hide();
//     } else if ($('fieldset').attr('id') == 'show-male') {
//       $('#radio-show-waist').show();
//       console.log("I'm being male");
//       $('#radio-show-chest').show();
//       $('#radio-show-inseam').show();
//       $('#radio-show-hips').hide();
//       $('#radio-show-bust').hide();
//     }
//   })
// })



$(document).ready(function() {
  bindListeners();
});


var bindListeners = function(){
  $('#radio-show-bust').hide();
  $('#radio-show-hips').hide();
  $('#radio-show-chest').hide();
  $('#radio-show-waist').hide();
  $('#radio-show-inseam').hide();
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


