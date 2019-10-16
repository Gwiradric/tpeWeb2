<?php

require_once "./views/GenreView.php";
require_once "./models/GenreModel.php";

class GenreController
{
    private $title;
    private $view;
    private $model;

    function __construct() {
        $this->title = "Movies";
        $this->view = new GenreView();
        $this->model = new GenreModel();
    }

    function insertGenre() {
        if ((isset($_POST['name']) && (isset($_POST['description'])))) {
            $name = $_POST['name'];
            $description = $_POST['description'];
            $this->model->insertGenre($name, $description);
        }
    }

    function deleteGenre($params) {
        $this->model->deleteGenre($params);
        header(HOME);
    }

    function showGenre($id) {
        $genres = $this->model->getGenre($id);
        $this->view->Home($this->title, $genres);
    }

    function editGenre($id) {
        $genre = $this->model->getGenre($id);
        $this->view->Home($this->title, $genres);
    }

    function home() {
        $genres = $this->model->getGenres();
        $this->view->home($this->title, $genres);
    }

    function showGenreForm() {
        $genres = $this->model->getGenres();
        $this->view->genreForm($this->title, $genres);
    }

}
