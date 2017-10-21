<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.Usuario"%>
<%@page import="com.modelo.CrudUsuario"%>
<%@page import="com.modelo.Departamento"%>
<%@page import="com.modelo.CrudDepto"%>
<%@page import="java.util.List"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src=".../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href=".../css/bootstrap.css">
        <script>
            function cargar(cod,user,clave,tipo)
            {
                document.frmUsu.codUsuario.value=cod;
                document.frmUsu.username.value=user;
                document.frmUsu.clave.value=clave;
                document.frmUsu.tipo.value=tipo;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admUsu.jsp');
        </script>
        <%
        }
        %>
    </head>
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String back= "";
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('vistaEmp.jsp');</script>");
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            out.print("<script>location.replace('vistaDelegado.jsp');</script>");
        } else {
            out.print("<script>window.history.back();</script>");
            back= "<div class='modal fade'>";
        }
    %>
    <% CrudUsuario crudUsu=new CrudUsuario(); %>
    <body>
    <% out.print(back);%> <!--No permite que se vea nada de la pagina-->
        <div class="container-fluid">
            <center>
                <h1>USUARIOS</h1>
            </center>
            <div class="row">
                
                <div class="col-sm-6">
                    <form action="../procesarUsuario" method="POST" name="frmUsu" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cod: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Usuario" name="codUsuario">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">User Name </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Usuario" name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Clave </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" placeholder="" name="clave">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Tipo </label>
                            <div class="col-sm-10">
                                <select name="tipo" class="form-control">
                                    <option value="1">Administrador</option>
                                    <option value="2">Empleado</option>
                                    <option value="3">Magistrado</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="ingresar" class="btn btn-success"> Insertar</button>
                                <button type="submit" name="modificar" class="btn btn-info"> Modificar</button>
                                <button type="submit" name="eliminar" class="btn btn-danger"> Eliminar</button>
                               
                            </div>
                            <br>
                            <div class="col-sm-offset-2 col-sm-10">
                             
                                <button type="reset"  class="btn btn-info"> Cancelar</button>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="control-label col-sm-2"><a href="vistaAdm.jsp"><button type="button" class="btn btn-info"> Come Back</button></a></label>
                        </div>
                    </form>
                </div>
                <div class="col-sm-6">
                  
                    <table class="table table-striped">
                
                            <thead>
                                <tr>
                                    <td>Cod: </td>
                                    <td>Username: </td>
                                    <td>Clave: </td>
                                    <td>Tipo: </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Usuario> listaU=crudUsu.mostrarUsuario();
                                for(Usuario us:listaU) {
                                %>
                                <tr>
                                    <td><%= us.getId()%></td>
                                    <td><%= us.getUserName()%></td>
                                    <td><%= us.getClave()%></td>
                                    <td><%= us.getTipo() %></td>
                                    <td><a href="javascript:cargar(<%= us.getId()%>,'<%= us.getUserName()%>','<%= us.getClave() %>','<%= us.getTipo() %>');">Seleccionar</a></td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                    </table>

                </div>
               
            </div>
            
        </div>
       
    </body>
</html>
