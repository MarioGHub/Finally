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
        <title>Administrador</title>
    </head>
    <%
        String user = "";
        String back= "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('vistaEmp.jsp');</script>");
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            out.print("<script>location.replace('vistaDelegado.jsp');</script>");
        } else {
            out.print("<script>window.history.back();</script>");
            back= "<div class='modal fade'>";
        }
    %>
    <body class="inicio">
        <% out.print(back);%> <!--No permite que se vea nada de la pagina-->
        <header class="portada">
            <div class="col-md-3 col-md-offset-9">
                <a class="btn btn-default"href='closeU.jsp' style="background: pink;"><span class="fa fa-sign-out"></span> Cerrar Sesion <%=user%></a><br>
            </div>
            <img src="../images/tse.png"><br>
            <h1>ADMINISTRADOR</h1>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admDep.jsp">
                            <img src="../images/map_big.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Administrar Departamentos</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admMun.jsp">
                            <img src="../images/sanjuan.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Administrar Municipios</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admCV.jsp">
                            <img src="../images/Vote.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Administrar Centro de Votos</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admUsu.jsp">
                            <img src="../images/face-icon-png-4295.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Usuarios</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admDeI.jsp">
                            <img src="../images/69636.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Delegados Internacionales</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admJRV.jsp">
                            <img src="../images/111845-election-campaign.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Junta Receptora</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="admUr.jsp">
                            <img src="../images/sobres-electorales-y-caja_318-64514.jpg" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Urna</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <br>
            <br>
        </div>
    </body>
</html>
