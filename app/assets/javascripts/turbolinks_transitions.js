document.addEventListener('turbolinks:load', function() {
          document.getElementById('primary-content').className += 'animated slideInLeft';
});
document.addEventListener('turbolinks:visit', function() {
          document.getElementById('primary-content').className += 'animated slideOutLeft';
});
