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

    public function insertGenre($name, $description) {
        $this->model->insertGenre($name, $description);
    }

    public function deleteGenre($id) {
        $this->model->deleteGenre($id);
    }

    public function showGenres() {
        $genres = $this->model->getGenres();
        $this->view->Home($this->title, $genres);
    }
}
