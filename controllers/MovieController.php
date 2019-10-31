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

    public function __construct()
    {
        parent::__construct();
        $this->title = "Movies";
        $this->view = new MovieView();
        $this->model = new MovieModel();
    }

    public function insertMovie()
    {
        if ($this->isAdmin) {
            
            $name = $_POST['name'];
            $description = $_POST['description'];
            $id_genre = $_POST['id_genre'];
            $year = $_POST['year'];
            $rating = $_POST['rating'];
            $img = $_POST['img'];
            
            if (isset($name, $description, $id_genre, $year, $rating, $img)) {

                $movie = $this->model->getMovieName($name);
                
                if (empty($movie[0])) {
                    $this->model->insertMovie($name, $id_genre, $description, $year, $rating, $img);
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
        $this->view->showMovie($this->title, $movie[0], $this->isAdmin, $this->username, $genre[0]['name']);
    }

    public function showMovies($params)
    {
        $movies = $this->model->getMovies();
        $this->view->showMovies($this->title, $movies, $this->isAdmin, $this->username);
    }

    public function showMoviesGenre($params)
    {
        $movies = $this->model->getMoviesGenre($params[0]);
        $this->view->showMovies($this->title, $movies, $this->isAdmin, $this->username);
    }

    public function addMovieForm()
    {
        if ($this->isAdmin) {
            $movie = array("id_movie" => "", "id_genre" => "", "name" => "", "description" => "", "year" => "", "rating" => "", "img" => "");
            $genres = $this->model->getDropDrown();
            $link = "./";
            $action = "insert-movie";
            $this->subtitle = 'Add movie form';
            $this->view->movieForm($this->title, $this->subtitle, $this->isAdmin, $this->username, $link, $genres, $movie, $action);
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
            $this->view->movieForm($this->title, $this->subtitle, $this->isAdmin, $this->username, $link, $genres, $movie[0], $action, $id_movie[0], $movie[0]['img']);
        }

    }

    public function editMovie()
    {
        if ($this->isAdmin) {
            $name = $_POST['name'];
            $id_movie = $_POST['id_movie'];
            $description = $_POST['description'];
            $id_genre = $_POST['id_genre'];
            $year = $_POST['year'];
            $rating = $_POST['rating'];
            if (isset($name, $description, $id_genre, $year, $rating)) {

                $movie = $this->model->getMovieName($name);

                if (empty($movie[0])) {
                    $this->model->editMovie($id_movie, $id_genre, $name, $description, $year, $rating);
                }

            }
            header(HOME);
        }

    }
}
