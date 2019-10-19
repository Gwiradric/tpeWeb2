<?php

require_once "./views/MovieView.php";
require_once "./models/MovieModel.php";

class MovieController
{
    private $title;
    private $view;
    private $model;

    function __construct() {
        $this->title = "Movies";
        $this->view = new MovieView();
        $this->model = new MovieModel();
    }

    function insertMovie() {
        $name = $_POST['name'];
        $description = $_POST['description'];
        $id_genre = $_POST['id_genre'];
        $year = $_POST['year'];
        $rating = $_POST['rating'];
        if (isset($name, $description, $id_genre, $year, $rating))
            $this->model->insertMovie($name, $id_genre, $description, $year, $rating);
        header(HOME);
    }

    function deleteMovie($params) {
        $this->model->deleteMovie($params[0]);
        header(HOME);
    }

    function showMovie($id) {
        $movies = $this->model->getMovie($id);
        $this->view->showMovies($this->title, $movies);
    }

    function showMovies($params) {
        $movies = $this->model->getMovies();
        $this->view->showMovies($this->title, $movies);
    }

    function showMoviesGenre($params) {
        $movies = $this->model->getMoviesGenre($params[0]);
        $this->view->showMovies($this->title, $movies);
    }

    function addMovieForm() {
        $movie = array("id_movie" => "", "id_genre" => "",	"name" => "", "description" => "", "year" => "", "rating" => "");
        $genres = $this->model->getDropDrown();
        $id_movie = -1;
        $action = "./insert-movie";
        $this->view->movieForm($this->title, $genres, $id_movie, $movie, $action);
    }

    function editMovieForm($id_movie) {
        $movie = $this->model->getMovie($id_movie[0]);
        $genres = $this->model->getDropDrown();
        $action = "../edit-movies";
        $this->view->movieForm($this->title, $genres, $id_movie[0], $movie[0], $action);
    }

    function editMovie() {
        $name = $_POST['name'];
        $id_movie = $_POST['id_movie'];
        $description = $_POST['description'];
        $id_genre = $_POST['id_genre'];
        $year = $_POST['year'];
        $rating = $_POST['rating'];
        if (isset($name, $description, $id_genre, $year, $rating)) {
            $this->model->editMovie($id_movie, $id_genre, $name, $description, $year, $rating);
        }
        header(HOME);
    }
}
