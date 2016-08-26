$(document).ready(function(){
  $('.whats_happ_inner').on('click', function(event){
    event.preventDefault();
      $.ajax({
        method: "get",
        url: "/tweets/new"
      })
      .done(function(response){
        $(".whats_happening").html(response);
      });
    });

  $('.new').on('click', function(event){
      event.preventDefault();
        $.ajax({
          method: "get",
          url: "/tweets/new"
        })
        .done(function(response){
          $(".whats_happening").html(response);
        });
      });

});


