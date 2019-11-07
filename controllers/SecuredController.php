<?php

class SecuredController
{
    protected $isAdmin;
    protected $login;
    protected $username;

    function __construct()
    {
        session_start();
        $this->username = $this->getUsername();
        $this->login = $this->checkLogin();
        $this->isAdmin = $this->isAdmin();
    }

    function getUsername() {
        if (isset($_SESSION['user']))
            return ($_SESSION['user'][0]);
    }

    function checkLogin()
    {
        return (isset($_SESSION['user']));
    }

    function isAdmin() {
        if (isset($_SESSION['user'])) {
            return ($_SESSION['user'][1]);
        }
    }
}