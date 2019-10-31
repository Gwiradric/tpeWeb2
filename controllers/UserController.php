<?php

require_once "./views/UserView.php";
require_once "./models/UserModel.php";

class UserController
{
    private $title;
    private $subtitle;
    private $action;
    private $view;
    private $model;

    public function __construct()
    {
        $this->title = "Movies";
        $this->action = './insert-user';
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    public function insertUser()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $user = $this->model->getUserUsername($username);

        if (empty($user[0]) && (isset($username, $password))) {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $this->model->insertUser($username, $hash);
            header(HOME);
        } else {
            $this->subtitle = 'Register';
            $this->view->userForm($this->title, $this->subtitle, $this->action, 'Username is already used, please try use another one');
        }
    }

    public function addUser()
    {
        $this->subtitle = 'Register';
        $this->view->userForm($this->title, $this->subtitle, $this->action);
    }
}
