function resetCatModalForm() {
  $("#cat-upload-errors").hide();
  $("#cat-upload-errors").children().remove();
  $('#new_cat')[0].reset();
}