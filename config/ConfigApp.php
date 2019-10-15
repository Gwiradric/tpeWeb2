<?php
$port = ":80";
define ('HOME', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]));
define ('ADMIN', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"])  . '/admin');
define('LOGIN', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port .  dirname($_SERVER["PHP_SELF"]) . '/login');
define('EPISODIOS', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]) . '/episodios/');


class ConfigApp {
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
        '' => 'TemporadaController#Home',
        'home' => 'TemporadaController#Home',
        'temporadas' => 'TemporadaController#Home',
        'agregar' => 'TemporadaController#InsertarTemporada',
        'borrar' => 'TemporadaController#BorrarTemporada',
        'editarTemporada' => 'TemporadaController#EditarTemporada',
        'episodios' => 'EpisodiosController#MostrarEpisodios',
        'borrarepisodio' => 'EpisodiosController#BorrarEpisodio',
        'agregarepisodio' => 'EpisodiosController#agregarEpisodio',
        'editarepisodio' => 'EpisodiosController#editarEpisodio',
        'filtrar' => 'EpisodiosController#FiltrarTemporada',
        'login' => 'LoginController#login',
        'logout' =>'LoginController#logout',
        'verificar' => 'LoginController#verificar',
        'registrar' => 'RegistroController#registrar',
        'verificarRegistro' => 'RegistroController#verificarRegistro',
        'admin' => 'AdminController#GetUsuarios',
        'editarPermisos' => 'AdminController#EditarPermisos',
        'borrarUsuario' => 'AdminController#BorrarUsuario',
        'status' => 'LoginController#checkStatus',
        'agregarComentario' => 'ComentariosController#InsertarComentario'
    ];
}

?>
