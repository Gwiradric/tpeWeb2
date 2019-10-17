<?php

require_once('libs/Smarty.class.php');

class MovieView
{

    public function showMovies($title, $movies)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('movies', $movies);

        $smarty->display('templates/movies.tpl');
    }

    public function showAddMovieForm($title, $genres) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);

        $smarty->display('templates/addMovieForm.tpl');
    }
}