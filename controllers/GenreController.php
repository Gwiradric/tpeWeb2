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

    function insertGenre($name, $description) {
        $this->model->insertGenre($name, $description);
    }

    function deleteGenre($params) {
        $this->model->deleteGenre($params);
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

}
