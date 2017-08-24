$(document).on('turbolinks:load', function(){
  $('.show-crud').mouseenter(function(){
    $(this).find('.crud-tools').slideDown("fast");
  });

  $('.show-crud').mouseleave(function(){
    $(this).find('.crud-tools').slideUp("fast");
  });
});
