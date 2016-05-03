function generateCatQueue(catArray) {
  var catArray = []
  $.get({
    url: "/cats/random_cats.json"
  })
  .done(function(data) {
    storeAndGenerateVotingBoxes(data, catArray)
  })
}

function storeAndGenerateVotingBoxes(data, catArray) {
  if (catArray.length == 0) {
    catArray = data
    // console.log(catArray)
  } else {
    for (var i = 0; i < data.length; i++) {
      catArray.push(data[i])
    }
    // console.log(existingQueue)
  };
  generateVoteBoxes(catArray)
}

function generateVoteBoxes(array) {
  var cat1 = array[0]
  var cat2 = array[1]
  var cats = {
    cat1: cat1, 
    cat2: cat2
  }
  var html = JST['views/voting_boxes'](cats)
  // console.log(html)
  $('#vote-container').append(html)
}
