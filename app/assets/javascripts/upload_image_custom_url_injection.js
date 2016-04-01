function injectCatURLsToForm() {
  var $thisImage = $(this);
  var fullURL = $thisImage.data('full-url');
  $('#full-url').val(fullURL)
  var thumbnailURL = $thisImage.prev().attr('src')
  $('#thumbnail-url').val(thumbnailURL)
}