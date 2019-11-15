<?php

class CommentsModel
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO(
            'mysql:host=localhost;'
                . 'dbname=db_movies;charset=utf8',
            'root',
            ''
        );
    }

    function getCommentId($id) {
        $sentence = $this->db->prepare('SELECT * FROM comments WHERE id_comment = ?');
        $sentence->execute(array($id));
        return ($sentence->fetch(PDO::FETCH_OBJ));
    }

    function getCommentMovie($id_movie) {
        $sentence = $this->db->prepare('SELECT * FROM comments WHERE fk_id_movie = ?');
        $sentence->execute(array($id_movie));
        return ($sentence->fetchAll(PDO::FETCH_OBJ));
    }

    function getComments() {
        $sentence = $this->db->prepare('SELECT * FROM comments');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_OBJ));
    }

    function insertComment($comment, $score, $id_movie, $id_user) {
        $sentence = $this->db->prepare('INSERT INTO comments (comment, score, fk_id_movie, fk_id_user) VALUES (?, ?, ?, ?)');
        $sentence->execute(array($comment, $score, $id_movie, $id_user));
        return ($this->db->lastInsertId());
    }

    function deleteComment($id) {
        $sentence = $this->db->prepare('DELETE FROM comments WHERE id_comment = ?');
        $sentence->execute(array($id));
    }

    function updateComment($id, $comment, $score, $id_movie, $id_user) {
        $sentence = $this->db->prepare('UPDATE comments SET comment = ?, score = ?, fk_id_movie = ?, fk_id_user = ? WHERE id_comment = ?');
        $sentence->execute(array($comment, $score, $id_movie, $id_user, $id));
    }
}
