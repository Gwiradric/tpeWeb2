<?php

require_once('libs/Smarty.class.php');

class GenreView
{

    public function home($title, $genres)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);

        $smarty->display('templates/index.tpl');
    }

    public function addGenreForm($title, $genres) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);

        $smarty->display('templates/addGenreForm.tpl');
    }

    public function editGenreForm($title, $genres, $id) {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);
        $smarty->assign('id', $id);

        $smarty->display('templates/editGenreForm.tpl');
    }
}