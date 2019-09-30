<?php

class GenreModel
{
    private $db;

    function __construct() {
        $this->db = new PDO(
            'mysql:host=localhost;'
                . 'dbname=db_peliculas;charset=utf8',
            'root',
            ''
        );
    }

    function getGenre($id) {
        $sentence = $this->db->prepare('select * from genero where id_genero = ?');
        $sentence->execute([$id]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getGenres() {
        $sentence = $this->db->prepare('select * from genero');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function insertGenre($name, $description) {
        $sentence = $this->db->prepare('INSERT INTO genero (nombre, descripcion) VALUES (?, ?)');
        $sentence->execute([$name, $description]);
        header("Location: " . BASE_URL);
    }

    function deleteGenre($id) {
        $sentence = $this->db->prepare("delete from genero where id_genero = ?");
        $sentence->execute([$id]);
        header("Location: " . BASE_URL);
    }

}
