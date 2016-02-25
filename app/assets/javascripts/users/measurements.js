// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  measurementPicListener();
});


var measurementPicListener = function(){
  $('#measurement_hips').on('click', function(event){
  	event.preventDefault();
  	var targeted = $(this);

  	$('#measurement-image').append("<img src="/assets/images/hips.png">")
  	

};
