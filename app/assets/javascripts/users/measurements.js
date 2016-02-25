// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
 +  $('#new_post_link').on('click', function(e){
 +   console.log("this is just a test")
 +   e.preventDefault()
 +   $(this).toggle();
 +   var targeted = $(this);