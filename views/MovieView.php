<?php

require_once('libs/Smarty.class.php');

class MovieView
{

    public function showMovies($title, $movies, $login)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('movies', $movies);
        $smarty->assign('login', $login);

        $smarty->display('templates/movies.tpl');
    }

    public function movieForm($title, $genres, $movie, $action, $id_movie = -1) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);
        $smarty->assign('id', $id_movie);
        $smarty->assign('movie', $movie);
        $smarty->assign('action', $action);

        $smarty->display('templates/movieForm.tpl');
    }
}