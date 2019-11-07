<?php

require_once "./views/UserView.php";
require_once "./models/UserModel.php";

class UserController extends SecuredController
{
    private $title;
    private $subtitle;
    private $action;
    private $view;
    private $model;

    public function __construct()
    {
        parent::__construct();
        $this->title = "Movie Club";
        $this->action = "insert-user";
        $this->link = "./";
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
            $loginController = new LoginController();
            $loginController->checklogin($username, $password);
        } else {
            $this->subtitle = 'Register';
            $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action, 'Username is already used, please try use another one');
        }
    }

    public function addUser()
    {
        $this->subtitle = 'Register';
        $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action);
    }

    public function showUsers() {
        if ($this->isAdmin) {
            $this->subtitle = 'Users';
            $users = $this->model->getUsers();
            $this->link = "../";
            $this->view->showUsers($this->title, $this->link, $this->subtitle, $this->username, $this->isAdmin, $users);
        } else {
            header(HOME);
        }
    }
}
