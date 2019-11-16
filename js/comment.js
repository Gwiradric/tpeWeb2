"use strict"

document.querySelector("#form-comments").addEventListener('submit', addComment);

let app = new Vue({
    el: "#template-vue-comments",
    data: {
        subtitle: "Comments of the movie",
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
        app.comments = comments; // similar a $this->smarty->assign("tasks", $tasks)
    })
    .catch(error => console.log(error));
}


function addComment(e) {
    e.preventDefault();

    let dataComment = document.getElementById("movie-data");

    let data = {
        comment:  "test",
        score:  "1",

        // comment:  (document.querySelector("input[name=comment]")).value,
        // score:  (document.querySelector("input[name=score]")).value,
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



getComments();