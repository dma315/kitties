function prepareCatEditForm() {
  var catID = $(this).closest('.cat-submission-container').data('id')
  var catURL = "/cats/" + catID
  var catName = $(this).closest('.cat-submission-container').data('name')
  var catMatchupID = $(this).closest('.cat-submission-container').data('matchup-id')
  var catMatchupURL = "www.elokitty.com/cats/matchup/" + catMatchupID
  $("#edit-cat-form").attr('action', catURL)
  $("#delete-cat-button").attr('action', catURL)
  $("#share-url").attr('value', catMatchupURL)
  $("#cat-name").attr('value', catName)
}

function clearEditCatForm() {
  $('#edit-cat-form')[0].reset();
}