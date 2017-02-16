//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require bootstrap-datepicker
//= require_tree .

// app/assets/javascripts/application.js

//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$(document).ready(function() {
  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1
  });
});
