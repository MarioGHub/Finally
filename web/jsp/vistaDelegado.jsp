<%-- 
    Document   : index
    Created on : 09-23-2017, 12:32:34 PM
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
        <title>DELEGADO</title>
    </head>
    <%
        String user = "";
        String admin = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('vistaEmp.jsp');</script>");
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
            admin = "<a class='btn btn-info' href='vistaAdm.jsp'> Panel Administrador</a>";
        } else {
            out.print("<script>location.replace('../');</script>");
        }
    %>
    <body class="inicio">
        <header class="portada">
            <div class="col-md-3 col-md-offset-9">
                <a class="btn btn-default" href='closeU.jsp' style="background: pink;"><span class="fa fa-sign-out"></span> Cerrar Sesion <%=user%></a><br>
            </div>
            <img src="../images/tse.png"><br>
            <h1>DELEGADO INTERNACIONAL</h1>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admDep.jsp">
                            <img src="../images/static.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Visualizar Estadisticas</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                </div>
                <div class="col-sm-4">
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-sm-4">

                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
            <br>
        </div>
    </body>
</html>
