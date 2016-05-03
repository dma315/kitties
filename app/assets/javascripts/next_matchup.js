// Pre Vote -> Generate array of 10, cache to 4
// After Vote 1 -> Cache becomes 3, generate array of 10 more, cache to 8
// Vote 2 -> Cache becomes 7, no generation of array, 

function loadFirstMatchup() {
  generateCatQueue().done(function() {
    populateVoteBoxes();
    var $firstMatchup = $('.vote-boxes').first();
    $firstMatchup.fadeIn();
  });
}

function nextMatchup() {
  
  if (CATARRAY <= 4) {
    loadFirstMatchup();
  } else {
    populateVoteBoxes()
  }

  var $voteBoxes = $('.vote-boxes')
  var $currentMatchup = $($voteBoxes[0])
  var $nextMatchup = $($voteBoxes[1])
  $currentMatchup.remove().fadeOut();
  $nextMatchup.fadeIn();
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
  var $html = $(html).hide();
  $('#vote-container').append($html)
}

