<?php

class SecuredController
{
    protected $isAdmin;
    protected $login;
    protected $email;

    function __construct()
    {
        session_start();
        $this->email = $this->getEmail();
        $this->login = $this->checkLogin();
        $this->isAdmin = $this->isAdmin();
    }

    function getEmail() {
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