<?php

require_once "./libs/Smarty.class.php";

class UserView
{
    function userForm($title, $link, $login, $subtitle, $action, $message = '') {
        $smarty = new Smarty();

        $smarty->assign('action', $action);
        $smarty->assign('login', $login);
        $smarty->assign('link', $link);
        $smarty->assign('subtitle', $subtitle);
        $smarty->assign('title', $title);
        $smarty->assign('message', $message);

        $smarty->display('templates/userForm.tpl');
        
    }

    function showUsers($title, $link, $subtitle, $username, $login, $users) {
        $smarty = new Smarty();

        $smarty->assign('users', $users);
        $smarty->assign('title', $title);
        $smarty->assign('link', $link);
        $smarty->assign('login', $login);
        $smarty->assign('username', $username);
        $smarty->assign('subtitle', $subtitle);

        $smarty->display('templates/users.tpl');

    }
}
