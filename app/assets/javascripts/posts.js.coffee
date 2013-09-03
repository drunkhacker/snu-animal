# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () ->
  $("#new_comment").bind "ajax:success", (xhr, comment, status) ->
    date = moment new Date Date.parse comment.created_at
    dom = "<li class=\"comment list-group-item clearfix\">
      <div class=\"animal-profile pull-left\">
        <img class=\"img-circle\" src =\"/animal_pics/#{comment.animal.name}.jpg\">
        <small class=\"animal-name text-center\">#{comment.animal.name}</small>
      </div>
      <p class=\"comment-body clearfix list-group-item-text\">#{comment.body}</p>
      <small class=\"comment-time text-muted pull-right\">#{date.format("YYYY.MM.DD h:m a")}</small></li>"

    $("#no-comment").remove()
    $("#comments").append dom
    $("#comment_body").val ""
