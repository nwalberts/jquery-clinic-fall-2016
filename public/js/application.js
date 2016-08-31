
// $(function(){ $(document).foundation(); });

$(document).ready(function(){
  $("#thing-button").click(function() {
    var newThing = $("#thing-name").val();
    $("ul").append("<li>" + newThing + "</li>");
    $("#thing-name").val("");
  });
});
