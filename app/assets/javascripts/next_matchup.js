// Get 5 cats, put them in the cache
// Move one up from cache
// Check if cache has 2 or fewer matchups

function renderInitialMatchup() {
  getCatQueueData().done(function() {
    renderCatQueue();
    renderNextMatchup();
  });
}

// AJAX request to fill the CATARRAY
function getCatQueueData() {
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

// Creates individual matchup divs, while removing cats from the array
function createMatchupTemplate() {
  var cat1 = CATARRAY.shift()
  var cat2 = CATARRAY.shift()
  var cats = {
    cat1: cat1, 
    cat2: cat2
  }
  var html = JST['views/voting_boxes'](cats)
  var $html = $(html);
  return $html
}

// Renders matchups into a hidden div
function renderCatQueue() {
  while (CATARRAY.length > 0) {
    var $html = createMatchupTemplate()
    $('#kitty-cache').append($html)
  }
}

function renderNextMatchup() {
  $('#matchup-container').children().remove();
  var nextMatchup = $('#kitty-cache').children()[0]
  var $nextMatchup = $(nextMatchup).hide();
  // console.log($nextMatchup)
  $('#matchup-container').append($nextMatchup)
  $nextMatchup.fadeIn();
}