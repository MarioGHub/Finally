<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.CentroVotos"%>
<%@page import="com.modelo.CrudCentroVotos"%>
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
            function cargar(num,idmun,nombre,encar,dir,jrv)
            {
                document.frmCV.numcentro.value=num;
                document.frmCV.idmunicipio.value=idmun;
                document.frmCV.numjrv.value=jrv;
                document.frmCV.nombre.value=nombre;
                document.frmCV.encargado.value=encar;
                document.frmCV.direccion.value=dir;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admCV.jsp');
        </script>
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
    <% CrudCentroVotos crudCV=new CrudCentroVotos(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>CENTRO DE VOTOS</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-6">
                    <form action="../procesarCentroVotos" method="POST" name="frmCV" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Municipio" name="numcentro">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Municipio </label>
                            <div class="col-sm-10">
                                <select name="idmunicipio" class="form-control">
                                    <%
                                    List<Municipio> lsMun=crudCV.lsMun();
                                    for (Municipio m:lsMun){
                                    %>
                                    <option value="<%= m.getIdMunicipio()%>"><%= m.getNombreMun()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                                <label class="control-label col-sm-2">Nombre: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="nombre">
                                </div>
                        </div>
                        <div class="form-group">
                                <label class="control-label col-sm-2">Direccion: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="direccion">
                                </div>
                        </div>
                        <div class="form-group">
                                <label class="control-label col-sm-2">Encargado: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="encargado">
                                </div>
                        </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Numero Juntas Receptoras </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="numjrv">
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
                                    <td>Numero Centro</td>
                                    <td>Municpio</td>
                                    <td>Nombre</td>
                                    <td>Direccion</td>
                                    <td>Encargado</td>
                                    <td>Numero Junta Receptora</td>    
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<CentroVotos> listaCv=crudCV.mostrar();
                                for(CentroVotos cv:listaCv) {
                                %>
                                <tr>
                                    <td><%= cv.getNumCentro()%></td>
                                    <td><%= cv.getIdMunicipio()%></td>
                                    <td><%= cv.getNombre()%></td>
                                    <td><%= cv.getDireccion()%></td>
                                     <td><%= cv.getEncargado()%></td>
                                    <td><%= cv.getNumeroJRV()%></td>
                                    <td><a href="javascript:cargar(<%= cv.getNumCentro()%>,'<%= cv.getIdMunicipio()%>','<%= cv.getNombre()%>','<%= cv.getDireccion()%>','<%= cv.getEncargado()%>','<%= cv.getNumeroJRV()%>');">Seleccionar</a></td>
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
