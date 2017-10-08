<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

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
            function cargar(cod,nombre,num)
            {
                document.frmDepto.codDepto.value=cod;
                document.frmDepto.nombre.value=nombre;
                document.frmDepto.numDipu.value=num;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admDep.jsp');
        </script>
        <%
        }
        %>
    </head>
    <% CrudDepto crudDep=new CrudDepto(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>DEPARTAMENTO</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-4">
                    <form action="../procesarDepartamento" method="POST" name="frmDepto" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cod: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Departamento" name="codDepto">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Departamento" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero de Diputados </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="" name="numDipu">
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
                                    <td>Cod</td>
                                    <td>NOmbre</td>
                                    <td>Numero Diputados</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Departamento> listaD=crudDep.mostrar();
                                for(Departamento dep:listaD) {
                                %>
                                <tr>
                                    <td><%= dep.getCodDepto()%></td>
                                    <td><%= dep.getNombre()%></td>
                                    <td><%= dep.getNumeroDipu()%></td>
                                    <td><a href="javascript:cargar(<%= dep.getCodDepto()%>,'<%= dep.getNombre()%>','<%= dep.getNumeroDipu()%>');">Seleccionar</a></td>
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
