<%-- 
    Document   : close
    Created on : 09-23-2017, 10:15:45 PM
    Author     : Rivera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession obSesion = request.getSession();
    obSesion.invalidate();
    out.print("<script>location.replace('../index.jsp');</script>");
%>      
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Debe de <a href="index.jsp">Loguearse</a> para poder volver a Ingresar</h1>
    </body>
</html>
