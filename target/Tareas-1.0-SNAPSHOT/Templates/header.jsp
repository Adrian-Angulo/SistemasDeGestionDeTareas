<!-- Template Footer -->
<!-- Añadir los import de bibliotecas y clases -->


<!-- Enlazar archivos de BootStrap, establecer condiciones base y abrir etiquetas base -->
<!-- Nombrar Proyecto -->
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Tarea"%>
<%@page import="Controlador.ControladorDeTareas"%>
<%@page import="Controlador.ControladorDeUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tareas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="script/script.js" type="text/javascript"></script>        
        <!-- importacion del link de font awesome para los iconos -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

    </head>
    
    <body>  
        
       <% if (request.getAttribute("inicioSesionFallido") != null) { %>
    <div class="alert alert-danger" role="alert">
       Ups! parece que la cuenta no existe, verifica bien.
    </div>
<% } %>

    </body>
