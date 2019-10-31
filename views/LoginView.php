<?php

require_once "./libs/Smarty.class.php";

class LoginView
{
    function showLogin($title, $subtitle, $message = '') {
        $smarty = new Smarty();
        $smarty->assign('subtitle', $subtitle);
        $smarty->assign('title', $title);
        $smarty->assign('message', $message);
        
        $smarty->display('templates/login.tpl');
    }
}
