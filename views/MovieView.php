<?php

require_once('libs/Smarty.class.php');

class MovieView
{
    public function showMovie($title, $link, $movie, $login, $email, $genre)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('link', $link);
        $smarty->assign('movie', $movie);
        $smarty->assign('login', $login);
        $smarty->assign('email', $email);
        $smarty->assign('genre', $genre);

        $smarty->display('templates/movie.tpl');
    }

    public function showMovies($title, $isAdmin, $link, $movies, $login, $email)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('isAdmin', $isAdmin);
        $smarty->assign('link', $link);
        $smarty->assign('movies', $movies);
        $smarty->assign('login', $login);
        $smarty->assign('email', $email);

        $smarty->display('templates/all-movies.tpl');
    }

    public function movieForm($title, $subtitle, $login, $email, $link, $genres, $movie, $action, $id_movie = -1, $img = 0) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('subtitle', $subtitle);
        $smarty->assign('genres', $genres);
        $smarty->assign('id', $id_movie);
        $smarty->assign('link', $link);
        $smarty->assign('movie', $movie);
        $smarty->assign('action', $action);
        $smarty->assign('img', $img);
        $smarty->assign('login', $login);
        $smarty->assign('email', $email);

        $smarty->display('templates/movieForm.tpl');
    }
}