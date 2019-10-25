<?php

require_once "./libs/Smarty.class.php";

class UserView
{
    function userForm($title, $message = '') {
        $smarty = new Smarty();

        $smarty->assign('title', $title);
        $smarty->assign('message', $message);

        $smarty->display('templates/userForm.tpl');
        
    }
}
