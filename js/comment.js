document.addEventListener("DOMContentLoaded", async () => {
  "use strict";

  let app = new Vue({
    el: "#template-vue-comments",
    data: {
      subtitle: "Comments of the movie",
      user: null,
      average: 0,
      comments: [],
      admin: null,
      login: document.getElementById("movie-data").dataset.login,
      auth: true
    },
    computed: {
      size: {
        get: function() {
          return this.comments.length;
        }
      }
    },
    methods: {
      addComment: async function addComment(e) {
        e.preventDefault();

        let dataComment = document.getElementById("movie-data");

        let data = {
          comment: document.getElementById("comment-text").value,
          user: app.user,
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
            getAverage();
          })
          .catch(error => console.log(error));
      },

      deleteComment: async function deleteComment(number) {
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
    }
  });


  app.admin = document.getElementById("movie-data").dataset.admin;
  
  if (app.login != "") {
    app.user = document.getElementById("data-email").dataset.email;
  }

  async function getComments() {
    let data = document.getElementById("movie-data");
    let url = "../api/comments/" + data.dataset.id_movie;

    fetch(url)
      .then(response => response.json())
      .then(comments => {
        app.comments = comments;
      })
      .catch(error => console.log(error));
  }

  async function getAverage() {
    let data = document.getElementById("movie-data");
    let url = "../api/comments/" + data.dataset.id_movie;

    fetch(url)
      .then(response => response.json())
      .then(comments => {
        let sum = 0;
        for (let i = 0; i < comments.length; i++) {
          sum += parseInt(comments[i]["score"]);
        }
        app.average = Math.round((sum / comments.length) * 10) / 10;
      })
      .catch(error => console.log(error));
  }

  getComments();
  getAverage();
});
