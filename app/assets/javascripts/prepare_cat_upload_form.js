function prepareCatUploadForm() {
  // console.log("hello")
  resetCatModalForm();
  injectCatURLs($(this))
}

function injectCatURLs($imageClicked) {
  var $thisImage = $imageClicked;
  var fullURL = $thisImage.data('full-url');
  $('#full-url').val(fullURL)
  var thumbnailURL = $thisImage.data('thumbnail-url')
  $('#thumbnail-url').val(thumbnailURL)
}