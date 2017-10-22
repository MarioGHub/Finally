<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.Padron"%>
<%@page import="com.modelo.Urna"%>
<%@page import="com.modelo.CrudPadron"%>
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
            function cargar(dui,nombre,direccion,nourna,genero,edad)
            {
                document.frmPa.dui.value=dui;
                document.frmPa.nombre.value=nombre;
                document.frmPa.direccion.value=direccion;
                document.frmPa.nourna.value=nourna;
                document.frmPa.genero.value=genero;
                document.frmPa.edad.value=edad;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            <%-- alert('<%= request.getAttribute("valor") %>');--%>
            location.replace('jsp/admPa.jsp');
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
            usuario = objSesion.getAttribute("usuario").toString();
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            usuario = objSesion.getAttribute("usuario").toString();
        } else {
            out.print("<script>location.replace('../');</script>");
        }
    %>
    <% CrudPadron crudPa=new CrudPadron(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>Padron</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-6">
                    <form action="../procesarPadron" method="POST" name="frmPa" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Dui: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Dui" name="dui">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Persona" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Direccion </label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="direccion"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero Urna </label>
                            <div class="col-sm-10">
                                <select name="nourna" class="form-control">
                                    <%
                                    List<Urna> lsUrna=crudPa.listarUrna();
                                    for (Urna u:lsUrna){
                                    %>
                                    <option value="<%= u.getNoUrna()%>"><%= u.getNoUrna()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Genero </label>
                            <div class="col-sm-10">
                               Masculino <input type="radio"  placeholder="" name="genero" value="Masculino">
                               Femenino <input type="radio"  placeholder="" name="genero" value="Femenino">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Edad </label>
                            <div class="col-sm-10">
                               <input type="text" class="form-control" placeholder="" name="edad">
                               
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="ingresar" onclick="if (!confirm('¿Desea insertar el registro?'))return false;" class="btn btn-success"> Insertar</button>
                                <button type="submit" name="modificar" onclick="if (!confirm('¿Desea modificar el registro?'))return false;" class="btn btn-info"> Modificar</button>
                                <button type="submit" name="eliminar" onclick="if (!confirm('¿Desea eliminarar el registro?'))return false;" class="btn btn-danger"> Eliminar</button>
                               
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
                                    <td>Dui</td>
                                    <td>Nombre</td>
                                    <td>Direccion</td>
                                    <td>No Urna</td>
                                    <td>Genero</td>
                                    <td>Edad</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Padron> listaP=crudPa.mostrar();
                                for(Padron pa:listaP) {
                                %>
                                <tr>
                                    <td><%= pa.getDui()%></td>
                                    <td><%= pa.getNombre()%></td>
                                    <td><%= pa.getDireccion()%></td>
                                    <td><%= pa.getNourna()%></td>
                                    <td><%= pa.getGenero()%></td>
                                    <td><%= pa.getEdad()%></td>
                                    <td><a href="javascript:cargar(<%= pa.getDui()%>,'<%= pa.getNombre()%>','<%= pa.getDireccion()%>','<%= pa.getNourna()%>','<%= pa.getGenero()%>','<%= pa.getEdad()%>');">Seleccionar</a></td>
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
