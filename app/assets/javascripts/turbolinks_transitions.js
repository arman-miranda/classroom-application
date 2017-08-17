document.addEventListener('turbolinks:load', function() {
          document.getElementById('primary-content').className += 'animated slideInLeft';
          var alertEle = document.getElementById('alert')
          var noticeEle = document.getElementById('notice')

          if(noticeEle!= null){
            document.getElementById('notice').className += 'animated slideInDown';
          }else if(alertEle!= null){
            document.getElementById('alert').className += 'animated slideInDown';
          }
});
document.addEventListener('turbolinks:visit', function() {
          document.getElementById('primary-content').className += 'animated slideOutLeft';
});

