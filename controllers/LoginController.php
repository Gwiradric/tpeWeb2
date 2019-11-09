<?php


require_once "./helper/Mailer.php";
require_once "./views/UserView.php";
require_once "./models/UserModel.php";

class LoginController extends SecuredController
{
    private $title;
    private $action;
    private $model;
    private $view;
    private $subtitle;
    private $link;

    public function __construct()
    {
        $this->title = "Movie Club";
        $this->subtitle = 'Login';
        $this->action = "check-login";
        $this->link = "./";
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    public function login()
    {
        $user = array(
            'id_user' => '',
            'username' => '',
            'password' => '',
        );
        $this->view->userForm($this->title, $user, $this->link, $this->isAdmin, $this->subtitle, $this->action);
    }

    public function checkLogin($username = "", $password = "")
    {
        if (($username == "") && ($password == "")) {
            $username = $_POST['username'];
            $password = $_POST['password'];
        }

        $user = $this->model->getUserUsername($username);

        if (isset($user[0])) {
            if (password_verify($password, $user[0]['password'])) {
                session_start();

                $_SESSION['user'] = array($username, $user[0]['admin']);

                header(HOME);
            } else {
                $user = array(
                    'id_user' => '',
                    'username' => '',
                    'password' => '',
                );
                $this->view->userForm($this->title, $user, $this->link, $this->isAdmin, $this->subtitle, $this->action, "Username or password are incorrect");
            }
        } else {
            $user = array(
                'id_user' => '',
                'username' => '',
                'password' => '',
            );
            $this->view->userForm($this->title, $user, $this->link, $this->isAdmin, $this->subtitle, $this->action, "User not found");
        }
    }

    public function createRandomCode()
    {
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
        srand((double)microtime()*1000000);
        $i = 0;
        $pass = '' ;
    
        while ($i <= 7) {
            $num = rand() % 33;
            $tmp = substr($chars, $num, 1);
            $pass = $pass . $tmp;
            $i++;
        }
    
        return time().$pass;
    }

    public function sendMessage()
    {
        $username = $_POST['username'];

        if (isset($username)) {
            
            $user = $this->model->getUserUsername($username);

            $code = $this->createRandomCode();

            if (isset($user[0])) {
                $this->model->updateCode($code, $user[0]['id_user']);
                
                $mailer = new Mailer();
                $mailBody = 'Recovery link <a href="http://' . $_SERVER["SERVER_NAME"] . dirname($_SERVER["PHP_SELF"]) . '/reset-password/' . $code . '">HERE</a>';
            
                $message = $mailer->sendMail($username, $mailBody);
                $this->recoverPassword($message);
            } else {
                $message = "This user doesn't exist";
                $this->recoverPassword($message);
            }
        }
    }

    public function resetPassword($params){
        $code = $params[0];

        if (isset($code)) {
            $user = $this->model->getUserCode($code);
    
            if (isset($user)) {
                $message = "";
                $subtitle = "Reset Password";
                $link = "../";
                $this->action = "update-password";
                $this->view->userForm($this->title, $user[0], $link, $this->login, $subtitle, $this->action, $message);
            }

        }
    }

    public function recoverPassword($message = '')
    {
        $subtitle = "Recover password";
        $this->view->showRecoverPassword($this->title, $subtitle, $this->link, $this->login, $message);
    }

    public function logout()
    {
        session_start();
        session_destroy();
        header(HOME);
    }
}
