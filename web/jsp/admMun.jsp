<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

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
        <script src=".../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href=".../css/bootstrap.css">
        <script>
            function cargar(id,nombre,depto,cv)
            {
                document.frmMun.idmunicipio.value=id;
                document.frmMun.nombre.value=nombre;
                document.frmMun.nodepto.value=depto;
                document.frmMun.numcv.value=cv;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admMun.jsp');
        </script>
        <%
        }
        %>
    </head>
    <% CrudMunicipio crudMuni=new CrudMunicipio(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>MUNICIPIO</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-6">
                    <form action="../procesarMunicipio" method="POST" name="frmMun" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cod: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Municipio" name="idmunicipio">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Departamento </label>
                            <div class="col-sm-10">
                                <select name="nodepto" class="form-control">
                                    <%
                                    List<Departamento> lsDep=crudMuni.lsDep();
                                    for (Departamento d:lsDep){
                                    %>
                                    <option value="<%= d.getCodDepto() %>"><%= d.getNombre() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero de Centro de Votos </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="" name="numcv">
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
                                    <td>Cod</td>
                                    <td>Nombre</td>
                                    <td>Departamento ID</td>
                                    <td >Numero de Centros</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Municipio> listaM=crudMuni.mostrar();
                                for(Municipio mun:listaM) {
                                %>
                                <tr>
                                    <td><%= mun.getIdMunicipio()%></td>
                                    <td><%= mun.getNombreMun()%></td>
                                    <td><%= mun.getNoDepto()%></td>
                                    <td><%= mun.getNumeroCV()%></td>
                                    <td><a href="javascript:cargar(<%= mun.getIdMunicipio()%>,'<%= mun.getNombreMun()%>','<%= mun.getNoDepto()%>','<%= mun.getNumeroCV() %>');">Seleccionar</a></td>
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
