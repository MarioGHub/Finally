<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.DelegadoInternacional"%>
<%@page import="com.modelo.CrudJunta"%>
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
            function cargar(numjr,numcv,iddel,nombre,canpap,car,gen,fecnac,dir,tel)
            {
                document.frmJRV.numjuntavotos.value=numjr;
                document.frmJRV.numcentro.value=numcv;
                document.frmJRV.iddelegado.value=iddel;
                document.frmJRV.nombre.value=nombre;
                document.frmJRV.cantidadpapeletas.value=canpap;
                document.frmJRV.cargo.value=car;
                document.frmJRV.genero.value=gen;
                document.frmJRV.fechanac.value=fecnac;
                document.frmJRV.direccion.value=dir;
                document.frmJRV.telefono.value=tel;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            <%-- alert('<%= request.getAttribute("valor") %>');--%>
            location.replace('jsp/admJRV.jsp');
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
    <% CrudJunta crudJRV=new CrudJunta(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>JUNTA RECEPTORA DE VOTOS</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-4">
                    <form action="../procesarJunta" method="POST" name="frmJRV" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero Junta: </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="numjuntavotos">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Centro Voto: </label>
                            <div class="col-sm-10">
                                <select name="numcentro" class="form-control">
                                    <%
                                    List<CentroVotos> lsCV=crudJRV.lsCV();
                                    for (CentroVotos cv:lsCV){
                                    %>
                                    <option value="<%= cv.getIdMunicipio()%>"><%= cv.getNombre() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Delegado: </label>
                            <div class="col-sm-10">
                                <select name="iddelegado" class="form-control">
                                    <%
                                    List<DelegadoInternacional> lsDI=crudJRV.lsDI();
                                    for (DelegadoInternacional di:lsDI){
                                    %>
                                    <option value="<%= di.getIddelegado() %>"><%= di.getNombre() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre Directivo: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Municipio" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cantidad de Papeletas: </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="cantidadpapeletas">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cargo: </label>
                            <div class="col-sm-10">
                                <select name="cargo" class="form-control">
                                    <option>Presidente</option>
                                    <option>Secretario</option>
                                    <option>Vocal 1</option>
                                    <option>Vocal 2</option>
                                    <option>Vocal 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Genero: </label>
                            <div class="col-sm-10">
                                <label><input type="radio"  name="genero" value="Masculino">Masculino </label>
                                <label><input type="radio"  name="genero" value="Femenino">Femenino </label>
                            </div>
                        </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2">Fecha Nacimiento </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="fechanac">
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="control-label col-sm-2">Direccion: </label>
                                <div class="col-sm-10">
                                    <textarea name="direccion" class="form-control"></textarea>
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="control-label col-sm-2">Telefono: </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Ingrese nombre de Municpio" name="telefono">
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
                
                <div class="col-sm-8">
                    <table class="table table-striped">
                
                            <thead>
                                <tr>
                                    <td>Numero Junta</td>
                                    <td>Numero Centro</td>
                                    <td>ID Delegado</td>
                                    <td>Nombre</td>
                                    <td>Cantidad Papeletas</td>
                                    <td>Cargo</td>
                                    <td>Genero</td>
                                    <td>Fecha Nac</td>
                                    <td>Direccion</td>
                                    <td>Telefono</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<JuntaReceptora> listaJRV=crudJRV.mostrar();
                                for(JuntaReceptora jr:listaJRV) {
                                %>
                                <tr>
                                    <td><%= jr.getNumjuntavotos()%></td>
                                    <td><%= jr.getNumcentro()%></td>
                                    <td><%= jr.getIddelegado()%></td>
                                    <td><%= jr.getNombre()%></td>
                                    <td><%= jr.getCantidadPapeletas()%></td>
                                    <td><%= jr.getCargo()%></td>
                                    <td><%= jr.getGenero()%></td>
                                    <td><%= jr.getFechanac()%></td>
                                    <td><%= jr.getDireccion()%></td>
                                    <td><%= jr.getTelefono()%></td>
                                    <td><a href="javascript:cargar(<%= jr.getNumjuntavotos() %>,'<%= jr.getNumcentro() %>','<%= jr.getIddelegado()%>','<%= jr.getNombre()%>','<%= jr.getCantidadPapeletas()%>','<%= jr.getCargo()%>','<%= jr.getGenero()%>','<%= jr.getFechanac()%>','<%= jr.getDireccion()%>','<%= jr.getTelefono()%>');">Seleccionar</a></td>
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
