<?php

require_once "./views/LoginView.php";
require_once "./models/UserModel.php";

class LoginController extends SecuredController
{
    private $title;
    private $action;
    private $model;
    private $view;
    private $subtitle;
    private $link;

    public function __construct()
    {
        $this->title = "Movie Club";
        $this->subtitle = 'Login';
        $this->action = "check-login";
        $this->link = "./";
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    public function login()
    {
        $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action);
    }

    public function checkLogin($username = "", $password = "")
    {
        if (($username == "") && ($password == "")) {
            $username = $_POST['username'];
            $password = $_POST['password'];
        }

        $user = $this->model->getUserUsername($username);
        
        if (isset($user[0])) {
            if (password_verify($password, $user[0]['password'])) {
                session_start();
                // $_SESSION["username"] = $username;
                // $_SESSION["id_user"] = $user[0]['id_user'];

                $_SESSION['user'] = array($username, $user[0]['admin']);

                header(HOME);
            } else {
                $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action, "Username or password are incorrect");
            }
        } else {
            $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action, "User not found");
        }
    }

    public function logout()
    {
        session_start();
        session_destroy();
        header(HOME);
    }
}
