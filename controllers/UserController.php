<?php

require_once "./views/UserView.php";
require_once "./models/UserModel.php";

class UserController
{
    private $title;
    private $view;
    private $model;

    public function __construct()
    {
        $this->title = "Users";
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
        } else {
            $this->view->userForm($this->title, 'Username is already used, please try use another one');
        }
    }

    public function addUser()
    {
        $this->view->userForm($this->title);
    }
}
