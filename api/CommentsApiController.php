<?php

require_once "JSONView.php";
require_once "ApiController.php";
require_once "./models/CommentsModel.php";

class CommentsApiController extends ApiController
{

    function getComment($params = []) {
        $id = $params[':ID'];

        $comment = $this->model->getComment($id);
        
        if ($comment) {
            $this->view->response($comment, 200);
        } else {
            $this->view->response("Error getting task", 500);
        }
    }

    function getComments($params = '') {
        $comments = $this->model->getComments();
        
        if ($comments) {
            $this->view->response($comments, 200);
        } else {
            $this->view->response("Error getting task", 500);
        }
    }

    function addComment($params = []) {
        $comment = $this->getData();

        $commentId = $this->model->insertComment($comment->comment, $comment->score, $comment->id_movie, $comment->id_user);

        $newComment = $this->model->getComment($commentId);

        if ($newComment) {
            $this->view->response($newComment, 200);
        } else {
            $this->view->response("Error inserting task", 500);
        }
    }

    function deleteComment($params = []) {
        $id = $params[':ID'];

        $comment = $this->model->deleteComment($id);

        if ($comment) {
            $this->view->response("Error deleting task", 500);
        } else {
            $this->view->response("Deleted", 200);
        }
    }

    function updateComment($params = []) {
        $comment_id = $params[':ID'];
        $comment = $this->model->getComment($comment_id);

        if ($comment) {
            $body = $this->getData();
            $newComment = $this->model->updateComment($comment_id, $body->comment, $body->score, $body->id_movie, $body->id_user);
            $this->view->response("Done", 200);
        } else {
            $this->view->response("Error updating comment", 404);
        }
    }
}
