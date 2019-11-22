"use strict";

let form = document.querySelector("#form-comments");
let deleteButton = document.getElementById("remove-comment");

if (form != null) {
  form.addEventListener("submit", addComment);
}

if (deleteButton != null) {
  deleteButton.addEventListener("click", deleteComment);
}

let app = new Vue({
  el: "#template-vue-comments",
  data: {
    subtitle: "Comments of the movie",
    average: 0,
    comments: [],
    auth: true
  },
  computed: {
    size: {
      get: function() {
        return this.comments.length;
      }
    }
  }
});

async function getComments() {
  let data = document.getElementById("movie-data");
  let url = "../api/comments/" + data.dataset.id_movie;

  fetch(url)
    .then(response => response.json())
    .then(comments => {
      app.comments = comments;

      let sum = 0;
      for (let i = 0; i < comments.length; i++) {
        sum += parseInt(comments[i]["score"]);
      }
      app.average = Math.round((sum / comments.length) * 10) / 10;

      setTimeout(deleteButtons, 1000);
    })
    .catch(error => console.log(error));
}

function deleteButtons() {
  let b = document.querySelectorAll("#remove-comment");
  b.forEach(b => {
    b.addEventListener("click", function() {
      deleteComment(b.dataset.id_comment);
    });
  });
}

async function addComment(e) {
  e.preventDefault();

  let today = new Date();
  let dd = String(today.getDate()).padStart(2, "0");
  let mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
  let yyyy = today.getFullYear();
  today = yyyy + "-" + mm + "-" + dd;

  let dataComment = document.getElementById("movie-data");

  let data = {
    comment: document.getElementById("comment-text").value,
    date: today,
    user: document.getElementById("user").value,
    score: document.getElementById("score-select").value,
    id_movie: dataComment.dataset.id_movie,
    id_user: dataComment.dataset.id_user
  };

  fetch("../api/comments", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data)
  })
    .then(response => {
      getComments();
    })
    .catch(error => console.log(error));
}

async function deleteComment(number) {
  //this function is responsible for editing the information on the server

  let url = "../api/comments/" + number;

  try {
    await fetch(url, {
      method: "DELETE"
    });
    getComments();
  } catch (t) {
    console.log(t);
  }
}

getComments();
