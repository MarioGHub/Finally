<%-- 
    Document   : loguin
    Created on : 09-23-2017, 12:32:51 PM
    Author     : Rivera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
    
    <div class="jumbotron text-center">
        <h1>Sistema de Votos</h1>
    
    </div>
        <div class="container-fluid">
            
            <div class="row">
                
                <div class="col-sm-9">
                    <form action="votanteSesion" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="dui">Dui: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="dui" placeholder="Ingrese Usuario">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pass">Clave: </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="pass" placeholder="Ingrese Clave">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pregunta">Pregunta: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="pregunta" placeholder="Ingrese Clave">
                            </div>
                        </div>
                        <div class="form-group">
                           
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default" name="btnEnviar">Enviar</button>
                                <button type="reset" class="btn btn-danger" >Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-sm-3">
                    <form action="iniciarSesio" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="txtUsu">Usuario: </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="txtUsu" placeholder="Ingrese Usuario">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="txtClave">Clave: </label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="txtClave" placeholder="Ingrese Clave">
                            </div>
                        </div>
                        <div class="form-group">
                           
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default" name="Enviar">Enviar</button>
                                <button type="reset" class="btn btn-danger" >Cancelar</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
                
            </div>
        </div>
    </body>
</html>
