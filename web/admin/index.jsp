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
        <!--Stylesheets-->
        <link rel="stylesheet" href="../css/font-awesome.css"/>
        <link rel="stylesheet"  href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <!--Scripts-->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Login Usuarios</title>
    </head>
    <body class="inicio">
        <div class="col-md-3">
            <a class="btn btn-info btn-block" style="color: #000;" href="../"><span class="font"> Acceso Votante</span></a>
        </div>
        <header class="portada">
            <div class="col-md-6">
                <img src="../images/tse.png"><br>
            </div>
            <h1>ACCESO USUARIOS</h1>
        </header>
        <div class="wrapper">
            <form action="../iniciarSesio" method="POST" class="form-signin">
                <div class=" form-group">
                    <span class="input-group-addon"><label>USUARIO</label><br><span class="fa fa-user"></span></span>
                    <input type="text" class="dui form-control" id="usu" name="txtUsu" placeholder="Usuario" required="" autofocus="" />
                </div> 
                <div class=" form-group">
                    <span class="input-group-addon"><label>CONTRASEÑA</label><br><span class="fa fa-lock"></span></span>
                    <input type="password" class="form-control" id="clave" name="txtClave" placeholder="Contraseña" required="" />
                </div>
                <center>
                    <button type="submit" class="btn btn-default btn-block fa fa-sign-in" style="background: turquoise" name="btnEnviar"> <span class="font"> Acceder</span></button>
                    <button type="reset" onclick="javascript: window.location.reload();" class="btn btn-default btn-block fa fa-times" style="background: pink;"><span class="font"> Cancelar</span></button>
                </center>
            </form>
        </div>
    </body>
</html>
