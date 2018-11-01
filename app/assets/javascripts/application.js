// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks   
$(document).on('turbolinks:load', function() {
  $(".sendtask").click(function(){
    var task = document.getElementById("task").value; 
    var current_day = $(this).parents('.task-container');
    function tasksItem(){
      

    } 
    $.ajax({
        url: "/days/:day_id/tasks".replace(":day_id",$(current_day).attr('data-day_id')),
        type: "POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        dataType: "json",
        data: ({task: {list: task}}),
        success: function(data) {
          $('#task').css('border-color','seagreen');
          var element = document.getElementById('tasklist');
          var text = data.list;
          var br = document.createElement('br');
          var p = document.createElement('p');
            p.innerText = text;
          var link = document.createElement('a');
            link.innerHTML = "delete task";
            link.setAttribute ("data-method", "delete");
            link.href = ("/days/:day_id/tasks/".replace(":day_id",$(current_day).attr('data-day_id'))+ data.id);
            element.appendChild(br);
            element.appendChild(p);
            element.appendChild(link);
          $('#task').val(''); 
        },
        error: 
          
          $('#task').each(function(){
            debugger;
              if(!$(this).val() || $(this).val() == ""){
                 $(this).css('border-color','red');
                 send = false;
                 alert('Input field is empty!')
              }
        }),
    });
  });
});