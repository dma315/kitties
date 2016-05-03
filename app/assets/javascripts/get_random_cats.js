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

function generateVoteBoxes(array) {
  var cat1 = array.shift()
  var cat2 = array.shift()
  var cats = {
    cat1: cat1, 
    cat2: cat2
  }
  var html = JST['views/voting_boxes'](cats)
  // console.log(html)
  $('#vote-container').append(html)
}
