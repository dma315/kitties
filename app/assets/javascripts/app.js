$(document).ready(function() {

  // Click to vote functionality
  $('.left-box').on('click', voteLeftBox);
  $('.right-box').on('click', voteRightBox);  

  // Keyboard voting functionality
  $(document).on('keyup', function(event) {
    var keynum = event.which
    if (keynum == 37) {
      // 37 == left-arrow
      voteLeftBox()
    } else if (keynum == 39) {
      // 39 == right-arrow
      voteRightBox()
    }
  })

  // Change URL of kitty upload form
  $('.insta-thumbnail-overlay').on('click', injectCatURLsToForm)

});