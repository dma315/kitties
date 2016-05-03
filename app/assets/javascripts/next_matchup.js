function nextMatchup() {
  if (CATARRAY.length <= 6) {
    generateCatQueue().done(populateVoteBoxes);
  } else {
    populateVoteBoxes()
  }
}

function generateCatQueue() {
  var request = $.get({
    url: "/cats/random_cats.json"
  })
  var promise = request.then(function(data) {
    if (CATARRAY.length == 0) {
      CATARRAY = data
    } else {
      for (var i = 0; i < data.length; i++) {
        CATARRAY.push(data[i])
      }
    };  
  })
  return promise
}

function populateVoteBoxes() {
  var cat1 = CATARRAY.shift()
  var cat2 = CATARRAY.shift()
  var cats = {
    cat1: cat1, 
    cat2: cat2
  }
  var html = JST['views/voting_boxes'](cats)
  // console.log(html)
  $('#vote-container').append(html)
}
