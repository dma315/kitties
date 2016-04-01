function prepareCatUploadForm() {
  $("#cat-upload-errors").hide().text("")
  injectCatURLs($(this))
}

function injectCatURLs($imageClicked) {
  var $thisImage = $imageClicked;
  var fullURL = $thisImage.data('full-url');
  $('#full-url').val(fullURL)
  var thumbnailURL = $thisImage.prev().attr('src')
  $('#thumbnail-url').val(thumbnailURL)
}