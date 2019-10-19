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
        if ((isset($username, $password))) {
            $this->model->insertUser($username, $password);
        }
        header(HOME);
    }

    function addUser(){
        $id = -1;
        $user = array('username' => '', 'password' =>'');
        $action = "./insert-user";
        $this->view->userForm($this->title, $user, $action, $id);
    } 
}
