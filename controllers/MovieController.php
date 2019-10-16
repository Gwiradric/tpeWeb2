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

    function insertMovie($name, $description, $year, $rating) {
        $this->model->insertMovie($name, $description, $year, $rating);
    }

    function deleteMovie($params) {
        $this->model->deleteMovie($params[0]);
        header(HOME);
    }

    function showMovie($id) {
        $movies = $this->model->getMovie($id);
        $this->view->showMovies($this->title, $movies);
    }

    function showMovies() {
        $movies = $this->model->getMovies();
        $this->view->showMovies($this->title, $movies);
    }

    function showMoviesGenre($params) {
        $movies = $this->model->getMoviesGenre($params[0]);
        $this->view->showMovies($this->title, $movies);
    }
}
