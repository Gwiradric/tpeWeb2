<?php

use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;

require_once './phpmailer/Exception.php';
require_once './phpmailer/PHPMailer.php';
require_once './phpmailer/SMTP.php';

require_once "./views/LoginView.php";
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
        $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action);
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
                $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action, "Username or password are incorrect");
            }
        } else {
            $this->view->userForm($this->title, $this->link, $this->isAdmin, $this->subtitle, $this->action, "User not found");
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
                $mail = new PHPMailer(true);

                $this->model->updateCode($code, $user[0]['id_user']);

                try {
                    //Server settings
                    $mail->SMTPDebug = 0; // Enable verbose debug output
                    $mail->isSMTP(); // Send using SMTP
                    $mail->Host = 'smtp.gmail.com'; // Set the SMTP server to send through
                    $mail->SMTPAuth = true; // Enable SMTP authentication
                    $mail->Username = 'gwiradric.ps3@gmail.com'; // SMTP username
                    $mail->Password = 'Elviejo12345'; // SMTP password
                    $mail->SMTPSecure = 'tls'; // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
                    $mail->Port = 587; // TCP port to connect to

                    //Recipients
                    $mail->setFrom('gwiradric.ps3@gmail.com', 'Movie Club');
                    $mail->addAddress($username); // Add a recipient

                    // Content
                    $mail->isHTML(true); // Set email format to HTML
                    $mail->Subject = 'Recovery Password';
                    $mail->Body = 'Recovery link <a href="http://' . $_SERVER["SERVER_NAME"] . dirname($_SERVER["PHP_SELF"]) . '/reset-password/' . $code . '">HERE</a>';


                    $mail->send();
                    $message = 'Message has been sent';
                    $this->recoverPassword($message);
                } catch (Exception $e) {
                    $message = "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                    $this->recoverPassword($message);
                }
            } else {
                $message = "This user doesn't exist";
                $this->recoverPassword($message);
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
