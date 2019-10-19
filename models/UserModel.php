<?php

class UserModel
{
    private $db;

    function __construct() {
        $this->db = new PDO(
            'mysql:host=localhost;'
                . 'dbname=db_movies;charset=utf8',
            'root',
            ''
        );
    }
    

    function insertUser($username, $password) {
        $sentence = $this->db->prepare('INSERT INTO users (username, password) VALUE (?, ?)');
        $sentence->execute(array($username, $password));
    }


    function getUsers() {
        $sentence = $this->db->prepare('SELECT * FROM users');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }
}
