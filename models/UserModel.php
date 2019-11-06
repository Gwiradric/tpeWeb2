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

    function insertUser($username, $password, $admin = 0) {
        $sentence = $this->db->prepare('INSERT INTO users (username, password, admin) VALUE (?, ?, ?)');
        $sentence->execute(array($username, $password, $admin));
    }

    function getUsers() {
        $sentence = $this->db->prepare('SELECT * FROM users');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getUserUsername($username) {
        $sentence = $this->db->prepare('SELECT * FROM users WHERE username = ?');
        $sentence->execute(array($username));
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }
}
