<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.Partido"%>
<%@page import="com.modelo.CrudPartido"%>
<%@page import="com.modelo.Municipio"%>
<%@page import="com.modelo.CrudMunicipio"%>
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
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css">
        <script>
            function cargar(id,nombre)
            {
                document.frmPar.idPartido.value=id;
                document.frmPar.nombre.value=nombre;
               
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
        </script>
        <%
        }
        %>
    </head>
    <% CrudPartido crudPar=new CrudPartido(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>PARTIDO</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-6">
                    <form action="procesarPartido" method="POST" name="frmPar" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cod: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Partido" name="idPartido">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Partido" name="nombre">
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
                            <label class="control-label col-sm-2"><a href="jsp/vistaAdm.jsp"><button type="button" class="btn btn-info"> Come Back</button></a></label>
                        </div>
                        
                    </form>
                </div>
                
                <div class="col-sm-6">
                    <table class="table table-striped">
                
                            <thead>
                                <tr>
                                    <td>Cod</td>
                                    <td>Nombre</td>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Partido> listaP=crudPar.mostrar();
                                for(Partido par:listaP) {
                                %>
                                <tr>
                                    <td><%= par.getIdPartido()%></td>
                                    <td><%= par.getNombre()%></td>
                                    
                                    <td><a href="javascript:cargar(<%= par.getIdPartido() %>,'<%= par.getNombre()%>');">Seleccionar</a></td>
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
