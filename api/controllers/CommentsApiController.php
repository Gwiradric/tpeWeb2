<?php

require_once "./views/JSONView.php";
require_once "../model/CommentsModel.php";

class CommentsApiController
{
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new CommentsModel();
        $this->view = new JSONView();
    }

    function getComments($params = '') {
        $comments = $this->model->getComments();
        $this->view->response($comments, 200);
    }
}
