function getRandomCats(existingQueue) {
  $.get({
    url: "/cats/random_cats.json",
    success: function(data) {
      storeRandomCats(data, existingQueue)
    }
  })
}

function storeRandomCats(data, existingQueue) {
  if (existingQueue.length == 0) {
    existingQueue = data
    // console.log(existingQueue)
  } else {
    for (var i = 0; i < data.length; i++) {
      existingQueue.push(data[i])
    }
    // console.log(existingQueue)
  };
}