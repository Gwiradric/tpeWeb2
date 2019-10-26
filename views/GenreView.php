<?php

require_once('libs/Smarty.class.php');

class GenreView
{

    public function home($title, $genres, $login, $username)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);
        $smarty->assign('login', $login);
        $smarty->assign('username', $username);

        $smarty->display('templates/index.tpl');
    }

    public function genreForm($title, $login, $username, $action, $genre, $id = -1) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('action', $action);
        $smarty->assign('genre', $genre);
        $smarty->assign('id', $id);
        $smarty->assign('username', $username);
        $smarty->assign('login', $login);

        $smarty->display('templates/genreForm.tpl');
    }
}