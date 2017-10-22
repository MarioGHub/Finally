<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.CentroVotos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.modelo.CrudVotante"%>
<%@page import="com.modelo.Votante"%>
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
        <link rel="stylesheet" href="../css/font-awesome.css"/>
        <link rel="stylesheet"  href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <!--Scripts-->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            function cargar(dui,nombre,direccion,genero,anio,apellido,depto,mun,centro,pregunta,pass)
            {
                document.frmVot.dui.value=dui;
                document.frmVot.nombre.value=nombre;
                document.frmVot.direccion.value=direccion;
                document.frmVot.genero.value=genero;
                document.frmVot.anio.value=anio;
                document.frmVot.apellido.value=apellido;
                document.frmVot.departamento.value=depto;
                document.frmVot.municipio.value=mun;
                document.frmVot.centro.value=centro;
                document.frmVot.pregunta.value=pregunta;
                document.frmVot.pass.value=pass;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admVot.jsp');
        </script>
        <%
        }
        %>
    </head>
    <% CrudVotante crudVot=new CrudVotante(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>Votante</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-3">
                    <form action="../procesarVotante" method="POST" name="frmVot" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Dui: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese Dui" name="dui">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Votante" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Direccion </label>
                            <div class="col-sm-10">
                                <textarea name="direccion" class="form-control">
                                    
                                </textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Genero </label>
                            <div class="col-sm-10">
                                Masculino: <input type="radio" placeholder="" name="genero" value="Masculino">
                                Femenino: <input type="radio" placeholder="" name="genero" value="Femenino">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Año de Nacimiento </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" placeholder="Ingrese año de nacimiento" name="anio">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Apellido </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese apellido de Votante" name="apellido">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Departamento </label>
                            <div class="col-sm-10">
                                <select name="departamento" class="form-control">
                                    <%
                                    List<Departamento> lsDep=crudVot.lsDep();
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
                            <label class="control-label col-sm-2">Municipio </label>
                            <div class="col-sm-10">
                                <select name="municipio" class="form-control">
                                    <%
                                    
                            
                                    List<Municipio> lsMun=crudVot.lsMun();
                                    
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
                            <label class="control-label col-sm-2">Centro de Votacion </label>
                            <div class="col-sm-10">
                                <select name="centro" class="form-control" >
                                    <%
                                    
                                    List<CentroVotos> lsCen=crudVot.lsCentro();
                                    
                                    for (CentroVotos c:lsCen){
                                        
                                    %>
                                    <option value="<%= c.getNumCentro()%>"><%= c.getNombre()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Pregunta </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese pregunta de Votante" name="pregunta">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Password </label>
                            <div class="col-sm-10">
                                <input type="pass" class="form-control" placeholder="Ingrese contraseña de Votante" name="pass">
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
                
                <div class="col-sm-9">
                    <table class="table table-striped">
                
                            <thead>
                                <tr>
                                    <td>Dui</td>
                                    <td>Nombre</td>
                                    <td>Direccion</td>
                                    <td>genero</td>
                                    <td>Año de Nacimiento</td>
                                    <td>Apellido</td>
                                    <td>Departamento</td>
                                    <td>Municipio</td>
                                    <td>Centro de Votos</td>
                                    <td>Pregunta</td>
                                    <td>Password</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Votante> listaV=crudVot.mostrar();
                                for(Votante vot:listaV) {
                                %>
                                <tr>
                                    <td><%= vot.getDui() %></td>
                                    <td><%= vot.getNombre()%></td>
                                    <td><%= vot.getDireccion()%></td>
                                    <td><%= vot.getGenero()%></td>
                                    <td><%= vot.getAnionacimiento()%></td>
                                    <td><%= vot.getApellido()%></td>
                                    <td><%= vot.getDepartamento()%></td>
                                    <td><%= vot.getMunicipio()%></td>
                                    <td><%= vot.getCentro()%></td>
                                    <td><%= vot.getPregunta()%></td>
                                    <td><%= vot.getPass()%></td>
                                    <td><a href="javascript:cargar(<%= vot.getDui()%>,'<%= vot.getNombre()%>','<%= vot.getDireccion()%>','<%= vot.getGenero()%>','<%= vot.getAnionacimiento()%>','<%= vot.getApellido()%>','<%= vot.getDepartamento()%>','<%= vot.getMunicipio()%>','<%= vot.getCentro()%>','<%= vot.getPregunta()%>','<%= vot.getPass()%>');">Seleccionar</a></td>
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
