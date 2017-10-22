<%-- 
    Document   : admCli
    Created on : 09-24-2017, 11:10:31 AM
    Author     : Rivera
--%>

<%@page import="com.modelo.Candidato"%>
<%@page import="com.modelo.Partido"%>
<%@page import="com.modelo.CrudCandidato"%>
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
            function cargar(idcan,idpar,nombre,genero,edad,telefono,direccion)
            {
                document.frmCan.idcandidato.value=idcan;
                document.frmCan.idpartido.value=idpar;
                document.frmCan.nombre.value=nombre;
                document.frmCan.genero.value=genero;
                document.frmCan.edad.value=edad;
                document.frmCan.telefono.value=telefono;
                document.frmCan.direccion.value=direccion;
            }
        </script>
        <% if(request.getAttribute("valor")!=null) { %>
        <script>
            alert('<%= request.getAttribute("valor") %>');
            location.replace('jsp/admCan.jsp');
        </script>
        <%
        }
        %>
    </head>
    <% CrudCandidato crudCan=new CrudCandidato(); %>
    <body>
    
        <div class="container-fluid">
            <center>
                <h1>CANDIDATO</h1>
            </center>
            <div class="row">
              
                <div class="col-sm-4">
                    <form action="../procesarCandidato" method="POST" name="frmCan" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Cod: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Candidato" name="idcandidato">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Partido </label>
                            <div class="col-sm-10">
                                <select name="idpartido" class="form-control">
                                    <%
                                    List<Partido> lsPar=crudCan.listaPartido();
                                    for (Partido p:lsPar){
                                    %>
                                    <option value="<%= p.getIdPartido()%>"><%= p.getNombre() %></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Candidato" name="nombre">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-2">Genero </label>
                            <div class="col-sm-10">
                                Masculino: <input type="radio"  placeholder="" name="genero" value="Masculino">
                                Femenino: <input type="radio"  placeholder="" name="genero" value="Femenino">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Edad </label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" placeholder="" name="edad" min="24" max="65">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Telefono </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese Telefono" name="telefono">
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
                                    <td>ID Candidato</td>
                                    <td>Partido</td>
                                    <td>Nombre</td>
                                    <td>Genero</td>
                                    <td>Edad</td>
                                    <td>Telefono</td>
                                    <td>Direccion</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Candidato> listaC=crudCan.mostrar();
                                for(Candidato can:listaC) {
                                %>
                                <tr>
                                    <td><%= can.getIdCandidato()%></td>
                                    <td><%= can.getIdPartido()%></td>
                                    <td><%= can.getNombre()%></td>
                                    <td><%= can.getGenero()%></td>
                                    <td><%= can.getEdad()%></td>
                                    <td><%= can.getTelefono()%></td>
                                    <td><%= can.getDireccion()%></td>
                                    <td><a href="javascript:cargar(<%= can.getIdCandidato()%>,'<%= can.getIdPartido()%>','<%= can.getNombre()%>','<%= can.getGenero()%>','<%= can.getEdad()%>','<%= can.getTelefono()%>','<%= can.getDireccion()%>');">Seleccionar</a></td>
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
