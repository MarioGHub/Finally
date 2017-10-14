<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.DelegadoInternacional"%>
<%@page import="com.modelo.CrudDelegado"%>
<%@page import="com.modelo.Departamento"%>
<%@page import="com.modelo.CrudDepto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src=".../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href=".../css/bootstrap.css">
        <script>
            function cargar(id,nombre,nacion,genero,tel,dir)
            {
                document.frmDI.iddelegado.value=id;
                document.frmDI.nombre.value=nombre;
                document.frmDI.nacionalidad.value=nacion;
                document.frmDI.genero.value=genero;
                document.frmDI.telefono.value=tel;
                document.frmDI.direccion.value=dir;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admDeI.jsp');
        </script>
        <%
        }
        %>
    </head>
     <%
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('vistaEmp.jsp');</script>");
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            usuario = objSesion.getAttribute("usuario").toString();
        } else {
            out.print("<script>location.replace('../index.jsp');</script>");
        }
    %>
    <% CrudDelegado crudDeIn=new CrudDelegado(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>DELEGADO INTERNACIONAL</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-4">
                    <form action="../procesarDelegado" method="POST" name="frmDI" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Id: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Departamento" name="iddelegado">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Departamento" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nacionalidad: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="" name="nacionalidad">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Genero: </label>
                            <div class="col-sm-10">
                                <label><input type="radio" name="genero" value="Masculino">Masculino</label>
                                <label><input type="radio" name="genero" value="Femenino">Femenino</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Telefono: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="" name="telefono">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Direccion: </label>
                            <div class="col-sm-10">
                                <textarea name="direccion" class="form-control"></textarea>
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
                
                <div class="col-sm-8">
                    <table class="table table-striped">
                
                            <thead>
                                <tr>
                                    <td>Id</td>
                                    <td>Nombre</td>
                                    <td>Nacionalidad</td>
                                    <td>Genero</td>
                                    <td>Telefono</td>
                                    <td>Direccion</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<DelegadoInternacional> listaDI=crudDeIn.mostrar();
                                for(DelegadoInternacional di:listaDI) {
                                %>
                                <tr>
                                    <td><%= di.getIddelegado()%></td>
                                    <td><%= di.getNombre()%></td>
                                    <td><%= di.getNacionalidad()%></td>
                                    <td><%= di.getGenero()%></td>
                                    <td><%= di.getTelefono()%></td>
                                    <td><%= di.getDireccion()%></td>
                                    <td><a href="javascript:cargar(<%= di.getIddelegado()%>,'<%= di.getNombre()%>','<%= di.getNacionalidad()%>','<%= di.getGenero()%>','<%= di.getTelefono()%>','<%= di.getDireccion()%>');">Seleccionar</a></td>
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
