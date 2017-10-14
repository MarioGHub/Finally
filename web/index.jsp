<%-- 
    Document   : loguin
    Created on : 09-23-2017, 12:32:51 PM
    Author     : Rivera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="font/css/font-awesome.min.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css">
        <title>Login</title>
    </head>
<body class="container-fluid">
    <div class="jumbotron text-center">
        <h1 style="background: skyblue; font-family: fantasy ;">Sistema de Votos</h1>
    </div>
    <div class="row">
        <div class="col-sm-9" >
            <div class="container--head">
                <div id="slidercaption" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slidercaption" data-slide-to="0" class="active"></li>
                        <li data-target="#slidercaption" data-slide-to="1"></li>
                        <li data-target="#slidercaption" data-slide-to="2"></li>
                        <li data-target="#slidercaption" data-slide-to="3"></li>
                        <li data-target="#slidercaption" data-slide-to="4"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="images/slider/imagen1.png" alt="..." style="width:100%">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/slider/imagen2.png" alt="..." style="width:100%">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/slider/imagen3.png" alt="..." style="width:100%">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/slider/imagen4.png" alt="..." style="width:100%">
                            <!--<div class="carousel-caption d-none d-md-block">
                                <h3>Lorem ipsum dolor</h3>
                            </div>-->
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/slider/imagen5.png" alt="..." style="width:100%">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#slidercaption" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#slidercaption" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <form action="iniciarSesio" method="POST" class="form-horizontal" style="border: solid; border-color: indigo; border-radius: 8px 8px 8px 8px; background: #a6e1ec;">
                <center><span style="color:#000;"class="fa fa-user fa-5x"></span></center>
                <div class="form-group">
                    <label class="control-label col-md-2" for="txtUsu">Usuario: </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtUsu" placeholder="Ingrese Usuario">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2" for="txtClave">Clave:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="txtClave" placeholder="Ingrese Clave">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default fa fa-sign-in" style="background: turquoise" name="btnEnviar"> Acceder</button>
                        <button type="reset" class="btn btn-default fa fa-times" style="background: pink"> Cancelar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
