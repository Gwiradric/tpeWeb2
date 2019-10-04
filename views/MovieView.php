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
}