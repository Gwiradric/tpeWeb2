<?php

require_once "./libs/Smarty.class.php";

class UserView
{
    function userForm($title, $user, $action, $id = -1) {
        $smarty = new Smarty();

        $smarty->assign('title', $title);
        $smarty->assign('user', $user);
        $smarty->assign('action', $action);
        $smarty->assign('id', $id);

        $smarty->display('templates/userForm.tpl');
        
    }
}
