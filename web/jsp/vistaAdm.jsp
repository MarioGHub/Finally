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
        <title>JSP Page</title>
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="jumbotron text-center">
                <h1>Administradores</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="../admDep.jsp">
                            <img src="../images/map_big.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Administrar Departamentos</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="../admMun.jsp">
                            <img src="../images/sanjuan.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Administrar Municipios</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="../admCV.jsp">
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
                        <a href="../admUsu.jsp">
                            <img src="../images/face-icon-png-4295.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Usuarios</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="../admDeI.jsp">
                            <img src="../images/69636.png" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Delegados Internacionales</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="thumbnail">.
                        <a href="../admJRV.jsp">
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
                        <a href="../admJRV.jsp">
                            <img src="../images/sobres-electorales-y-caja_318-64514.jpg" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gestionar Urna</p>
                            </div>
                        </a>
                    </div>
                    </div>
                    <div class="col-sm-4">
                         <%
                            HttpSession sesion= request.getSession();
                            String user;
                            String nivel;
                            if(sesion.getAttribute("usuario")!=null && sesion.getAttribute("nivel")!=null)
                            {
                                user=sesion.getAttribute("usuario").toString();
                                nivel=sesion.getAttribute("nivel").toString();
                                %>
                                <a href='../index.jsp?close=true'><img src="../images/exit.png"> Cerrar Sesion <%=user%></a>

                                <%
                            }
                            else
                            {
                                out.print("<script>location.replace('index.jsp');</script>");
                            }
                        %>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
                    <br>
                    <br>
            </div>
        </div>
        
    </body>
</html>
