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
        <!--Stylesheets-->
        <link rel="stylesheet" href="../css/font-awesome.css"/>
        <link rel="stylesheet"  href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <!--Scripts-->
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Administrar Departamentos</title>
        <script>
            function cargar(cod, nombre, num)
            {
                document.frmDepto.codDepto.value = cod;
                document.frmDepto.nombre.value = nombre;
                document.frmDepto.numDipu.value = num;
            }
        </script>
        <% if (request.getAttribute("valor") != null) { %>
        <script>
            location.replace('jsp/admDep.jsp');
        </script>
        <%
            }
        %>
    </head>
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String user = "";
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "2") {
            out.print("<script>location.replace('vistaEmp.jsp');</script>");
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "3") {
            usuario = objSesion.getAttribute("usuario").toString();
        } else {
            out.print("<script>location.replace('../');</script>");
        }
    %>
    <% CrudDepto crudDep = new CrudDepto(); %>
    <body class="inicio">
        <header class="portada">
            <div class="col-md-3 col-md-offset-9">
                <a class="btn btn-default" href='closeU.jsp' style="background: pink;"><span class="fa fa-sign-out"></span> Cerrar Sesion <%=user%></a><br>
            </div>
            <img src="../images/tse.png"><br>
            <h1>DEPARTAMENTO</h1>
        </header>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-4">
                    <form action="../procesarDepartamento" method="POST" name="frmDepto" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2">Codigo: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese codigo de Departamento" name="codDepto" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Nombre </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Ingrese nombre de Departamento" name="nombre" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2">Numero de Diputados </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="" name="numDipu" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="ingresar" onclick="if (!confirm('¿Desea ingresar el registro?'))return false;" class="btn btn-success"> Insertar</button>
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
                                <td>Codigo</td>
                                <td>Nombre</td>
                                <td>Numero Diputados</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Departamento> listaD = crudDep.mostrar();
                                for (Departamento dep : listaD) {
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
