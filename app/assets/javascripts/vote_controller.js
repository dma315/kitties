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
  animateVote(direction)
}

function animateVote(direction) {
  var $winner, $loser
  var $matchupContainer = $('#matchup-container')
  var $voteBoxes = $('#matchup-container .vote-boxes')
  if (direction == "left") {
    $winner = $matchupContainer.find(".left-box")
    $loser = $matchupContainer.find(".right-box")
  } else if (direction == "right") {
    $winner = $matchupContainer.find(".right-box")
    $loser = $matchupContainer.find(".left-box")
  }
  $winner.css({
    "transform": "scale(1.1,1.1)",
    "box-shadow": "0 0 30px white",
    "transition": "0.2s"
  })
  $loser.css({
    "transform": "scale(0.95,0.95)",
    "box-shadow": "0 0 30px red",
    "transition": "0.2s"
  })
  $voteBoxes.fadeOut("slow", function() {
    $voteBoxes.remove();
    renderNextMatchup();
  })
}