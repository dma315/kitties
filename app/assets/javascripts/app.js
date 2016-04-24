$(document).ready(function() {

  // Click to vote functionality
  $(document).on('click', '.left-box', voteLeftBox);
  $(document).on('click', '.right-box', voteRightBox);  

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
  $(document).on('click', '.insta-thumbnail-overlay', prepareCatUploadForm)

  // Change URL of kitty upload form
  $(document).on('click', '.cat-submission-overlay', prepareCatEditForm)

});