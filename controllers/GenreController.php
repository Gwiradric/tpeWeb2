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
        if ((isset($_POST['name'])) && (isset($_POST['description']))) {
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

    function editGenre() {
        if ((isset($_POST['name']) && (isset($_POST['description'])))) {
            $id_genre = $_POST['id_genre'];
            $name = $_POST['name'];
            $description = $_POST['description'];
            $this->model->editGenre($id_genre, $name, $description);
        }
        header(HOME);
    }

    function home() {
        $genres = $this->model->getGenres();
        $this->view->home($this->title, $genres);
    }

    function addGenreForm() {
        $id = -1;
        $genre = array("name" => '', "description" => '');
        $action = "./add";
        $this->view->genreForm($this->title, $action, $genre, $id);
    }

    function editGenreForm($id) {
        $genre = $this->model->getGenre($id[0]);
        $action = "../edit-genre";
        $this->view->genreForm($this->title, $action, $genre[0], $id[0]);
    }

}
