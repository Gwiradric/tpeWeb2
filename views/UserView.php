<?php

require_once "./libs/Smarty.class.php";

class UserView
{
    function userForm($title, $subtitle, $action, $message = '') {
        $smarty = new Smarty();

        $smarty->assign('action', $action);
        $smarty->assign('subtitle', $subtitle);
        $smarty->assign('title', $title);
        $smarty->assign('message', $message);

        $smarty->display('templates/userForm.tpl');
        
    }
}
