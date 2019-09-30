<?php

require('libs/Smarty.class.php');

class GenreView
{

    public function Home($title, $genres)
    {
        $smarty = new Smarty();
        $smarty->assign('title', $title);
        $smarty->assign('genres', $genres);

        $smarty->display('templates/genrForm.tpl');
    }
}