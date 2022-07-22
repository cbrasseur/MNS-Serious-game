<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    
</head>
<body>
    <div class="bg-dark">
        <div class="container">
            <form class="row needs-validation" action="index" method="get">
                <nav class="col navbar navbar-expand-lg navbar-dark">
                    <button type="input" class="navbar-brand, btn btn-dark" >
                        <img src="img/logo.png" width="50" height="50" alt="Site logo">
                        Ifa SeriousGame
                    </button>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div id="navbarContent" class="collapse navbar-collapse">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <button type="input" class="btn btn-dark">Accueil</button>
                            </li>
                        </ul>    
                    </div>
                   
                </nav>
            </form>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <i class="fa fa-key" aria-hidden="true"></i>
                </div>
                <div class="col-lg-12 login-title">
                    Espace de Connexion
                </div>
 
                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="post" action="login">
                            <div class="form-group">
                                <label class="form-control-label">Login</label>
                                <input type="text" class="form-control" name="txtLogin" placeholder="VotreEmail@mailBox.com">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">Mot de passe</label>
                                <input type="password" class="form-control" name="txtPassword" placeholder="Votre mot de passe">
                            </div>
 
                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>

        <style>
            html {
                background:white;
                font-family: 'Roboto', sans-serif;
            }
             
            .login-box {
                margin-top: 75px;
                height: auto;
                background:rgb(52,58,64);
                text-align: center;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            }
             
            .login-key {
                height: 100px;
                font-size: 80px;
                line-height: 100px;
                background: -webkit-linear-gradient(orangered, yellow);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
             
            .login-title {
                margin-top: 15px;
                text-align: center;
                font-size: 30px;
                letter-spacing: 2px;
                margin-top: 15px;
                font-weight: bold;
                color: #ECF0F5;
            }
             
            .login-form {
                margin-top: 25px;
                text-align: left;
            }
             
            input[type=text] {
                background-color: rgb(52,58,64);
                border: none;
                border-bottom: 2px solid orangered;
                border-top: 0px;
                border-radius: 0px;
                font-weight: bold;
                outline: 0;
                margin-bottom: 20px;
                padding-left: 0px;
                color: #ECF0F5;
            }
             
            input[type=password] {
                background-color: rgb(52,58,64);
                border: none;
                border-bottom: 2px solid orangered;
                border-top: 0px;
                border-radius: 0px;
                font-weight: bold;
                outline: 0;
                padding-left: 0px;
                margin-bottom: 20px;
                color: #ECF0F5;
            }
             
            .form-group {
                margin-bottom: 40px;
                outline: 0px;
            }
             
            .form-control:focus {
                border-color: yellow;
                -webkit-box-shadow: none;
                box-shadow: none;
                border-bottom: 2px solid yellow;
                outline: 0;
                background-color: #1A2226;
                color: #ECF0F5;
            }
             
            input:focus {
                outline: none;
                box-shadow: 0 0 0;
            }
             
            label {
                margin-bottom: 0px;
            }
             
            .form-control-label {
                font-size: 10px;
                color: #6C6C6C;
                font-weight: bold;
                letter-spacing: 1px;
            }
             
            .btn-outline-primary {
                border-color: orangered;
                color: orangered;
                border-radius: 0px;
                font-weight: bold;
                letter-spacing: 1px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            }
             
            .btn-outline-primary:hover {
                border-color: yellow;
                background-color: orangered;
                right: 0px;
            }
             
            .login-btm {
                float: left;
            }
             
            .login-button {
                padding-right: 0px;
                text-align: right;
                margin-bottom: 25px;
            }
             
            .login-text {
                text-align: left;
                padding-left: 0px;
                color: #A2A4A4;
            }
             
            .loginbttm {
                padding: 0px;
            }
            </style>
</body>
</html>