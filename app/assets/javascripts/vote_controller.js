function voteBox(direction) {

  var current_page = window.location.href
  var results = {}
  var left_cat_id = $('.left-box').attr('id')
  var right_cat_id = $('.right-box').attr('id')
  
  if (direction == "left") {
    var results = {
      "winner_id": left_cat_id,
      "loser_id": right_cat_id
    }

  } else if (direction == "right") {
    var results = {
      "winner_id": right_cat_id,
      "loser_id": left_cat_id
    }
  }

  $.ajax({
    url: "/votes",
    method: "post",
    data: results
  })

  // In a non-ajax world, the page reloads -- in an AJAX one, the next boxes show up
  // window.location.href = current_page
  nextMatchup()
}