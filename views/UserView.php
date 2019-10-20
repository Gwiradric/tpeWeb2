<?php

require_once "./libs/Smarty.class.php";

class UserView
{
    function userForm($title, $user, $action) {
        $smarty = new Smarty();

        $smarty->assign('title', $title);
        $smarty->assign('user', $user);
        $smarty->assign('action', $action);

        $smarty->display('templates/userForm.tpl');
        
    }
}
