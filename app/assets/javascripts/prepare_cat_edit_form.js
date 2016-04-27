function prepareCatEditForm() {
  var catID = $(this).closest('.cat-submission-container').data('id')
  var catURL = "/cats/" + catID
  var catName = $(this).closest('.cat-submission-container').data('name')
  $("#edit-cat-form").attr('action', catURL)
  $("#delete-cat-button").attr('action', catURL)
  $("#cat-name").attr('value', catName)
}

function clearEditCatForm() {
  $('#edit-cat-form')[0].reset();
}