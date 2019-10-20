<?php

require_once "./views/LoginView.php";
require_once "./models/UserModel.php";

class LoginController
{
    private $title;
    private $model;
    private $view;

    public function __construct()
    {
        $this->title = "Login";
        $this->model = new UserModel();
        $this->view = new LoginView();
    }

    public function login()
    {
        $this->view->showLogin($this->title);
    }

    public function checkLogin()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $user = $this->model->getUserUsername($username);
        if (isset($user[0])) {
            if (password_verify($password, $user[0]['password'])) {
                session_start();
                $_SESSION["username"] = $username;
                $_SESSION["id_user"] = $user[0]['id_user'];
                header(HOME);
            } else {
                $this->view->showLogin($this->title, "Username or password are incorrect");
            }
        } else {
            $this->view->showLogin($this->title, "User not found");
        }
    }

    public function logout()
    {
        session_start();
        session_destroy();
        header(HOME);
    }
}
