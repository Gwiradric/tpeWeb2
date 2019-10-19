<?php

require_once "./views/LoginView.php";
require_once "./models/UserModel.php";

class LoginController
{
    private $title;
    private $model;
    private $view;

    function __construct() {
        $this->title = "Login";
        $this->model = new UserModel();
        $this->view = new LoginView();
    }

    function login() {
        $this->view->showLogin($this->title);
    }

    function checkLogin() {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $user = $this->model->getUserUsername($username);

        if (isset($user[0])) {
            if (password_verify($password, $user[0]['password'])) {
                session_start();
                $_SESSION["username"] = $username;
                header(HOME);
           } else
                $this->view->showLogin($this->title, "Username or password are incorrect");
        } else {
            $this->view->showLogin($this->title, "User not found");
        }
    }
}
