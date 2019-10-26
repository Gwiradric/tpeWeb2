<?php

class SecuredController
{
    protected $isAdmin;
    protected $username;

    function __construct()
    {
        $this->isAdmin = $this->checkLogin();
    }

    function checkLogin()
    {
        session_start();
        if (isset($_SESSION['username'], $_SESSION['id_user'])) {
            $this->username = $_SESSION['username'];
            return true;
        }
        return false;
    }
}