$(document).ready(function() {

  // Click to vote functionality
  $(document).on('click', '.left-box', function() {
    voteBox("left")
  });

  $(document).on('click', '.right-box', function() {
    voteBox("right")
  });  

  // Keyboard voting functionality
  $(document).on('keyup', function(event) {
    var keynum = event.which
    if (keynum == 37) { // 37 == left-arrow
      voteBox("left")
    } else if (keynum == 39) { // 39 == right-arrow
      voteBox("right")
    }
  })

  // Change URL of kitty upload form
  $(document).on('click', '.insta-thumbnail-overlay', prepareCatUploadForm)

  // Change URL of kitty upload form
  $(document).on('click', '.cat-submission-overlay', prepareCatEditForm)

  // Load images in perfect squares using NailThumb plugin
  $(document).on('page:change', function() {
    $('.nailthumb-container').nailthumb()  
  })
  
  $("#buttonSelector").click(function () {
     $(this).button('loading');
     // Long waiting operation here
     // $(this).button('reset');
  });

  $(document).on('click', '#submit-kitty-button', function() {
    waitingForGoogle = startSpinner('photo-upload-modal-dialog')
  })

  $('body').bind('touchstart', function() {
    // console.log("hello")
  })

});