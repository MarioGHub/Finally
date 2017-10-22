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
        <link rel="stylesheet" href="../css/font-awesome.css"/>
        <link rel="stylesheet"  href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <!--Scripts-->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="jumbotron text-center">
                <h1>SONSONATE</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h1>Partido 1</h1>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                </div>
                <div class="col-sm-3">
                    <h1>Partido 2</h1>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                </div>
                <div class="col-sm-3">
                    <h1>Partido 3</h1>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                </div>
                <div class="col-sm-3">
                    <h1>Partido 4</h1>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/boss.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                    <a href="#">
                            <img src="../images/woman.png" style="width: 50%;height: 150px" class="img-thumbnail">                 
                    </a>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div class="col-md-4">
                    <button class="btn btn-light" name="btnRegla">REGLAS</button> 
                </div>
                <div class="col-md-4">
                    <button class="btn btn-light" name="btnRegla">VOTAR</button> 
                </div>
                <div class="col-md-4">
                    
                </div>
            </div>
            </div>
            
        
                <br>
                <br>
                <div class="row">
                    <div class="col-sm-4">
                        
                    </div>
                    <div class="col-sm-4">
                         <%
                            HttpSession sesion= request.getSession();
                            String user;
                            String nivel;
                            if(sesion.getAttribute("dui")!=null && sesion.getAttribute("depto")!=null)
                            {
                                user=sesion.getAttribute("dui").toString();
                                nivel=sesion.getAttribute("depto").toString();
                                %>
                                <a href='../index.jsp?close=true'><img src="../images/exit.png"> Cerrar Sesion <%=user%></a>

                                <%
                            }
                            else
                            {
                                out.print("<script>location.replace('../');</script>");
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
