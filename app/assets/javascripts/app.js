$(document).ready(function() {

  $('.left-box').on('click', function() {
    voteLeftBox()
  });

  $('.right-box').on('click', function() {
    voteRightBox()
  });  

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
});