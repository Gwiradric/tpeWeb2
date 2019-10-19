<?php

require_once('libs/Smarty.class.php');

class GenreView
{

    public function home($title, $genres, $login)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);
        $smarty->assign('login', $login);

        $smarty->display('templates/index.tpl');
    }

    public function genreForm($title, $action, $genre, $id) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('action', $action);
        $smarty->assign('genre', $genre);
        $smarty->assign('id', $id);

        $smarty->display('templates/genreForm.tpl');
    }
}