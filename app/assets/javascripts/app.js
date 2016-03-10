$(document).ready(function() {

  var current_page = window.location.href
  var left_cat_id = $('.left-box').attr('id')
  var right_cat_id = $('.right-box').attr('id')

  $('.left-box').on('click', function() {
    var results = {
      "winner_id": left_cat_id,
      "loser_id": right_cat_id
    }
    $.ajax({
      url: "/votes",
      method: "post",
      data: results
    })
    window.location.href = current_page
  });

  $('.right-box').on('click', function() {
    var results = {
      "winner_id": right_cat_id,
      "loser_id": left_cat_id
    }
    $.ajax({
      url: "/votes",
      method: "post",
      data: results
    })
    window.location.href = current_page
  });  
});