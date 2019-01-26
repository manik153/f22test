var elements = document.getElementsByClassName("index-column");

// Declare a loop variable
var i;

// List View
function listView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].style.width = "100%";
  }
}

// Grid View
function gridView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].style.width = "50%";
  }
}

function upvoteArticle(articleId) {
  $.post("/article/"+articleId+"/article_vote",
  {
    voted: true
  },
  function(data, status){
    $('#upvote-article-counter-'+articleId).text(data['upvote']);
    $('#downvote-article-counter-'+articleId).text(data['downvote']);
  });
}

function downvoteArticle(articleId) {
  $.post("/article/"+articleId+"/article_vote",
  {
    voted: false
  },
  function(data, status){
    $('#upvote-article-counter-'+articleId).text(data['upvote']);
    $('#downvote-article-counter-'+articleId).text(data['downvote']);
  });
}