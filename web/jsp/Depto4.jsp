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
                <h1>La Libertad</h1>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="thumbnail">.
                        <a href="../admDep.jsp">
                            <img src="../images/hombre-que-sostiene-el-papel-voto-en-la-caja_318-64517.jpg" style="width: 80%;height: 250px" class="img-thumbnail">
                            <div class="caption">
                                <p>Gesttionar Votante</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-sm-3">
                    
                </div>
                <div class="col-sm-3">
                    
                </div>
                <div class="col-sm-3">
                    
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
                            String dui;
                            String depto;
                            if(sesion.getAttribute("dui")!=null && sesion.getAttribute("depto")!=null)
                            {
                                dui=sesion.getAttribute("dui").toString();
                                depto=sesion.getAttribute("depto").toString();
                                %>
                                <a href='../index.jsp?close=true'><img src="../images/exit.png"> Cerrar Sesion <%=dui%></a>

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
