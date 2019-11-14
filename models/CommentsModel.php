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

    function getComments() {
        $sentence = $this->db->prepare('SELECT * FROM comments');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }
}
