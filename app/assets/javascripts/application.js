// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  $('#notice').click(function() {
    $(this).slideUp();
  });

  $('#alert').click(function() {
    $(this).slideUp();
  });

  $('.modal').on('shown.bs.modal', function() {
    $('#user_current_password').focus();
  });
  
  $('#user_role_ids').change(function() {
    var selected = $('#user_role_ids').find(':selected').text();
    if(selected === "teacher"){
      $('#block_type').text('Advisory Block');
    } else {
      $('#block_type').text('Block');
    }
    
  });
});


