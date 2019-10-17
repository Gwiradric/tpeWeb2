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
        var_dump(entro);
        $this->model->deleteGenre($params);
        header(HOME);
    }

    function showGenre($id) {
        $genres = $this->model->getGenre($id);
        $this->view->Home($this->title, $genres);
    }

    function editGenre() {
        if ((isset($_POST['name']) && (isset($_POST['description'])))) {
            $id_genre = $_POST['id_genre'];
            $name = $_POST['name'];
            $description = $_POST['description'];
            var_dump($id_genre, $name, $description);
            $this->model->editGenre($id_genre, $name, $description);
        }
        header(HOME);
    }

    function home() {
        $genres = $this->model->getGenres();
        $this->view->home($this->title, $genres);
    }

    function addGenreForm() {
        $genres = $this->model->getGenres();
        $this->view->addGenreForm($this->title, $genres);
    }

    function editGenreForm($id) {
        $genres = $this->model->getGenres();
        $this->view->editGenreForm($this->title, $genres, $id);
    }

}
