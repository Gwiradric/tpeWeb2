<?php

require_once "./views/MovieView.php";
require_once "./models/MovieModel.php";
require_once "SecuredController.php";

class MovieController extends SecuredController
{
    private $title;
    private $subtitle;
    private $view;
    private $model;
    private $link;

    public function __construct()
    {
        parent::__construct();
        $this->title = "Movie Club";
        $this->view = new MovieView();
        $this->model = new MovieModel();
    }

    private function isJPG($imagenesTipos){
        foreach ($imagenesTipos as $tipo) {
          if($tipo != 'image/jpeg') {
            return false;
          }
        }
        return true;
    }

    public function insertMovie()
    {
        if ($this->isAdmin) {
            $pathTempImages = $_FILES['imagesToUpload']['tmp_name'];

            $name = $_POST['name'];
            $description = $_POST['description'];
            $id_genre = $_POST['id_genre'];
            $year = $_POST['year'];
            $rating = $_POST['rating'];

            
            if (isset($name, $description, $id_genre, $year, $rating, $pathTempImages)) {

                $movie = $this->model->getMovieName($name);
                
                if (empty($movie[0])) {
                    if($this->isJPG($_FILES['imagesToUpload']['type'])) {
                        $this->model->insertMovie($name, $id_genre, $description, $year, $rating, $pathTempImages);
                    }
                }
            }
            
            header(HOME);
        }
    }

    public function deleteMovie($params)
    {
        if ($this->isAdmin) {
            $this->model->deleteMovie($params[0]);
            header(HOME);
        }
    }

    public function showMovie($id)
    {
        $movie = $this->model->getMovie($id[0]);
        $genre = $this->model->getGenreId($movie[0]['id_genre']);
        $images = $this->model->getImagesId($id[0]);
        $this->link = "../";
        $this->view->showMovie($this->title, $this->link, $movie[0], $this->login, $this->email, $genre[0]['name'], $images);
    }

    public function showMovies($params)
    {
        $movies = $this->model->getMovies();
        $this->link = "../";
        $this->view->showMovies($this->title, $this->isAdmin, $this->link, $movies, $this->login, $this->email);
    }

    public function showMoviesGenre($params)
    {
        $movies = $this->model->getMoviesGenre($params[0]);
        $this->link = "../";
        $this->view->showMovies($this->title, $this->isAdmin, $this->link, $movies, $this->login, $this->email);
    }

    public function addMovieForm()
    {
        if ($this->isAdmin) {
            $movie = array("id_movie" => "", "id_genre" => "", "name" => "", "description" => "", "year" => "", "rating" => "");
            $genres = $this->model->getDropDrown();
            $link = "./";
            $action = "insert-movie";
            $this->subtitle = 'Add movie form';
            $this->view->movieForm($this->title, $this->subtitle, $this->login, $this->email, $link, $genres, $movie, $action);
        }
    }

    public function editMovieForm($id_movie)
    {
        if ($this->isAdmin) {
            $movie = $this->model->getMovie($id_movie[0]);
            $genres = $this->model->getDropDrown();
            $this->subtitle = 'Edit movie form';
            $link = "../";
            $action = "edit-movies";
            $this->view->movieForm($this->title, $this->subtitle, $this->login, $this->email, $link, $genres, $movie[0], $action, $id_movie[0]);
        }

    }

    public function editMovie()
    {
        if ($this->isAdmin) {

            $pathTempImages = $_FILES['imagesToUpload']['tmp_name'];
            $name = $_POST['name'];
            $id_movie = $_POST['id_movie'];
            $description = $_POST['description'];
            $id_genre = $_POST['id_genre'];
            $year = $_POST['year'];
            $rating = $_POST['rating'];

            if (isset($name, $description, $id_genre, $year, $rating)) {

                $movie = $this->model->getMovieName($name);

                if ((empty($movie[0])) || ($movie[0]['id_movie'] == $id_movie)) {
                    $this->model->editMovie($id_movie, $id_genre, $name, $description, $year, $rating, $pathTempImages);
                }

            }
            
            header(HOME);
        }

    }
}
