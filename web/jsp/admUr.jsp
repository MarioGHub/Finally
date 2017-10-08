<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.Urna"%>
<%@page import="com.modelo.CrudUrna"%>
<%@page import="com.modelo.JuntaReceptora"%>
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
            function cargar(no,junta)
            {
                document.frmUrn.nourna.value=no;
                document.frmUrn.nojunta.value=nojunta;
               
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admUr.jsp');
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
            out.print("<script>location.replace('vistaDelegado.jsp');</script>");
        } else {
            out.print("<script>location.replace('../index.jsp');</script>");
        }
    %>
    <% CrudUrna crudUrn=new CrudUrna(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>URNA</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-6">
                    <form action="../procesarUrna" method="POST" name="frmUr" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">No Urna </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Municipio" name="nourna">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">No Junta Receptora </label>
                            <div class="col-sm-10">
                                <select name="nojunta" class="form-control">
                                    <%
                                    List<JuntaReceptora> lsJr=crudUrn.lsCentro();
                                    for (JuntaReceptora jr:lsJr){
                                    %>
                                    <option value="<%= jr.getNumcentro()%>"><%= jr.getNombre()%></option>
                                    <%
                                    }
                                    %>
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
                                    <td>No Centro</td>
                                    <td>Municpio</td>
                                     
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Urna> listaUr=crudUrn.mostrar();
                                for(Urna ur:listaUr) {
                                %>
                                <tr>
                                    <td><%= ur.getNoUrna()%></td>
                                    <td><%= ur.getNoJuntaVotos()%></td>
                                   
                                    <td><a href="javascript:cargar(<%= ur.getNoUrna()%>,'<%= ur.getNoJuntaVotos()%>');">Seleccionar</a></td>
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
