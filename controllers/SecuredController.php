<?php

class SecuredController
{
    protected $isAdmin;

    function __construct()
    {
        $this->isAdmin = $this->checkLogin();
    }

    function checkLogin()
    {
        session_start();
        if (isset($_SESSION['username'], $_SESSION['id_user']))
            return true;
        return false;
    }
}