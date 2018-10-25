$(document).ready(function() {
  $('.sendtask').click(function() {
        var params = $('input');
        $.post('/post.php', params).done(function(data) {
              alert(data);
        });
  });
});