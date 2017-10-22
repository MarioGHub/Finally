<%-- 
    Document   : index
    Created on : 10-16-2017, 09:14:29 PM
    Author     : VA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Stylesheets-->
        <link type="text/css" rel="stylesheet" href="css/font-awesome.css"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel='stylesheet prefetch' href='css/bootstrap.min.css'/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <!-- Scripts -->
        <script src="js/validar.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.mask.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.dui').mask('00000000-0');
            });
        </script>
        <title>Login Votantes</title>
    </head>
    <body class="inicio">
        <header class="portada">
            <img src="images/tse.png"><br>
            <h1>ACCESO VOTANTE</h1>
        </header>
        <div class="wrapper">
            <div class="col-md-8">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">                
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="images/slider/img.png" alt="First slide">
                            <div class="carousel-caption">
                                <h3>PASO 1</h3>
                                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/slider/img.png" alt="Second slide">
                            <div class="carousel-caption">
                                <h3>PASO 2</h3>
                                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/slider/img.png" alt="Third slide">
                            <div class="carousel-caption">
                                <h3>PASO 3</h3>
                                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="images/slider/img.png" alt="Third slide">
                            <div class="carousel-caption">
                                <h3>PASO 4</h3>
                                <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <form action="iniciarSesionV" method="POST" class="form-signin">
                    <div class=" form-group">
                        <span class="input-group-addon"><label>DUI</label><br><span class="fa fa-vcard-o"></span></span>
                        <input type="text" class="dui form-control inputFormu" id="usu" minlength="10" name="dui" placeholder="00000000-0" onkeyup="validar()" required="" autofocus="" />
                    </div> 
                    <div class=" form-group">
                        <span class="input-group-addon"><label>CONTRASEÑA</label><br><span class="fa fa-lock"></span></span>
                        <input type="password" class="form-control inputFormu" id="clave" name="pass" placeholder="Contraseña" onkeyup="validar()" required="" />
                    </div>
                    <center>
                        <button id="boton" type="button" class="btn btn-info fa fa-sign-in btn-block" style="color: #000;" data-toggle="modal" data-target="#myModal" disabled="true"><span class="font"> Continuar</span></button>
                        <button type="button" onclick="javascript: window.location.reload();" class="btn btn-default btn-block fa fa-times" style="background: pink;"><span class="font"> Cancelar</span></button>
                    </center>
                    <!-- Modal respuesta-->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal contenedor-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times-circle"></span></button>
                                    <img src="images/tse.png">
                                </div>
                                <div class="modal-body">
                                    <label>Ingrese su respuesta....</label>
                                    <input type="text" id="res" class="form-control" name="pregunta" placeholder="Respuesta" required="" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default btn-block fa fa-times" data-dismiss="modal" style="background: pink;"><span class="font"> Cancelar</span></button>
                                    <button type="button" id="btnLR" onclick="lim()" class="btn btn-default btn-block fa fa-eraser" style="background: #9ffb8f;"><span class="font"> Limpiar</span></button>
                                    <button type="submit" class="btn btn-default btn-block fa fa-sign-in" style="background: turquoise" name="btnEnviar"> <span class="font"> Acceder</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
