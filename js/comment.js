"use strict"

let form = document.querySelector("#form-comments");
let deleteButton = document.getElementById("remove-comment");

if (form != null) {
    form.addEventListener('submit', addComment);
}

if (deleteButton != null) {
    deleteButton.addEventListener('click', deleteComment);
}

let app = new Vue({
    el: "#template-vue-comments",
    data: {
        subtitle: "Comments of the movie",
        average: 0,
        comments: [], 
        auth: true
    }
});

function getComments() {

    let data = document.getElementById("movie-data");
    let url = "../api/comments/" + data.dataset.id_movie;
    
    fetch(url)
    .then(response => response.json())
    .then(comments => {
        if (comments != "Error getting task") {
            app.comments = comments;
            let sum = 0;
            for (let i = 0; i < comments.length; i++) {
                sum += parseInt(comments[i]['score']);
            }
            app.average = (sum / comments.length).toFixed();
        }
    })
    .catch(error => console.log(error));
}


function addComment(e) {
    e.preventDefault();

    let dataComment = document.getElementById("movie-data");

    let data = {
        comment:  document.getElementById("comment-text").value,
        user: document.getElementById("user").value,
        score:  document.getElementById("score-select").value,
        id_movie:  dataComment.dataset.id_movie,
        id_user:  dataComment.dataset.id_user
    }

    console.log(data);

    fetch('../api/comments', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},       
        body: JSON.stringify(data) 
     })
     .then(response => {
        getComments();
     })
     .catch(error => console.log(error));
}

async function deleteComment() {
    //this function is responsible for editing the information on the server
    console.log('entro');

    let url = "../api/comments/" + data.dataset.id_comment;
    data = document.getElementById("delete-comment");
    
    try {
      await fetch(url + data.dataset.id_comment, {
        "method": "DELETE",
      });
      getComments();
    }
    catch (t) {
      console.log(t);
    }
  }

getComments();