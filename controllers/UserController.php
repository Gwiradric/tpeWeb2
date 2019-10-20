<?php

require_once "./views/UserView.php";
require_once "./models/UserModel.php";

class UserController
{
    private $title;
    private $view;
    private $model;

    function __construct() {
        $this->title = "Users";
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    function insertUser() {
        $username = $_POST['username'];
        $password = $_POST['password'];
        
        $user = $this->model->getUserUsername($username);

        if (empty($user[0]) && (isset($username, $password))) {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $this->model->insertUser($username, $hash);
        }
        header(HOME);
    }

    function addUser(){
        $user = array('username' => '', 'password' =>'');
        $action = "./insert-user";
        $this->view->userForm($this->title, $user, $action);
    } 
}
