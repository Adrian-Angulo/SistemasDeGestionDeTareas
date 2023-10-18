<%-- 
    Document   : Principal
    Created on : 7 oct. 2023, 19:57:57
    Author     : ADRIAN CASTILLO
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControladorArchivos"%>
<%@page import="Controlador.ControladorDeTareas"%>
<link rel="stylesheet" type="text/css" href="estilos/stylePrincipal.css">

<%@include file="Templates/header.jsp"%>


<nav class="navbar navbar-expand-lg bg-body-tertiary my-form2">
    <div style="font-family: 'Archivo Black';" class="container">
        <a class="navbar-brand"  href="#">Gestion de Tareas</a>
        <div class="navbar bg-body-tertiary" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item dropdown text-center">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%
                            String usuario = (String) session.getAttribute("usuario");
                            out.print(usuario);
                        %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Configuracion</a></li>
                        <li><a class="dropdown-item" href="index.jsp">Salir</a></li>
                    </ul>
                </li>

            </ul>

        </div>
    </div>
</nav>


<div style="font-family: 'Archivo Black';" class="container-fluid formulario-agregar" class="container p-4"> 

    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->


            <!-- alerta para indicar que no se encontro la tarea para agregar otra tarea despues de ella-->


            <% if (request.getSession().getAttribute("alertaDespues") != null && (boolean) request.getSession().getAttribute("alertaDespues") == true) { %>
            <div class="alert alert-danger alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
                 No se pudo agregar la nueva tarea. No se encontró la tarea anterior a la que se pretendía agregar la nueva.
            </div>
            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#registroExitosoAlert').alert('close');
                }, 4000);
            </script>
            <% request.getSession().removeAttribute("alertaDespues"); %>
            <% } %>


            <!-- alerta para indicar que no se puede registrar una tarea con un id existente-->


            <% if (request.getSession().getAttribute("alertaID") != null && (boolean) request.getSession().getAttribute("alertaID") == true) { %>
            <div class="alert alert-danger alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
                El ID que ha ingresado ya existe en nuestro sistema.
            </div>
            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#registroExitosoAlert').alert('close');
                }, 3000);
            </script>
            <% request.getSession().removeAttribute("alertaID"); %>
            <% } %>


            <!-- alerta para indicar que no se puede registrar una tarea con un id existente-->


            <% if (request.getSession().getAttribute("alertaIDnegativo") != null && (boolean) request.getSession().getAttribute("alertaIDnegativo") == true) { %>
            <div class="alert alert-danger alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
                El ID que ha ingresado no puede ser negativo o cero
            </div>
            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#alertaIDnegativo').alert('close');
                }, 3000);
            </script>
            <% request.getSession().removeAttribute("alertaIDnegativo"); %>
            <% } %>




            <div class="card card-body my-form"> <!-- tarjeta de trabajo -->


                <h3 class="text-center">Agregar Tarea</h3>
                <!-- Formulario que conecta con el servlet y manda por el metodo POST especificamos enctype para 
                manejar el formulario que manda el FILE. Basado: https://es.stackoverflow.com/questions/48643/como-guardar-imagen-en-proyecto-servlet
                -->
                <form action="SvAgregarTareas" method="POST" class="my-form">


                    <!-- Id -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Id</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="id" placeholder="Id de la tarea" class="form-control" required><br>
                    </div>

                    <!-- Titulo -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Titulo</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="titulo" placeholder="Titulo de tu tarea" class="form-control" required><br>
                    </div>

                    <!-- Descripción -->
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Descripcion" name="descripcion" id="descripcion" style="width: 100%; max-width: 395px; height: 120px;" required></textarea>
                        <label for="descripcion">Descripcion</label>
                        <div class="wordCountMessage" id="wordCount" >Tienes un maximo de 20 palabras</div>
                    </div><br>

                    <!-----fecha de vencimiento-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Fecha de vencimiento</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="date" name="fecha" class="form-control" required><br>
                    </div>


                    <!-----Agregar despues De una tarea-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Agregar despues de</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="despues" class="form-control" placeholder="Titulo de tarea"><br>
                    </div>
                    
                    
                    <!-----Agregar antes De una tarea-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Agregar Antes de</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="antes" class="form-control" placeholder="Titulo de tarea"><br>
                    </div>


                    <!-- inicio Bontones de agregar primero y ultimo -->

                    <div class="text-center" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="agregar" value="Primero" id="btnradio1" autocomplete="off">
                        <label class="btn btn-outline" for="btnradio1">Agregar Primero</label>

                        <input type="radio" class="btn-check" name="agregar" value="Ultimo" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline" for="btnradio2">Agregar Ultimo</label>
                    </div>

                    <!-- fin Bontones de agregar primero y ultimo -->
                    <br>
                    <!-- boton para agregar la tarea -->

                    <div class="text-center">                            
                        <input  class="btn btn-success mx-auto" type="submit" value="Agregar Tarea">
                    </div>
                </form>
            </div> 
        </div> 


        <!-- Creamos la tabla interactiva -->
        <div style="font-family: 'Archivo Black';" class="col-md-8">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Listado de tareas</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- nav bar  -->

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ordenar por
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>

                        </ul>

                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" id="searchInput" placeholder="Buscar por nombre" aria-label="Search">
                            <button class="btn btn-outline-success" type="button" id="searchButton">Buscar</button>
                        </form>



                    </div>
                </div>
            </nav>

            <!-- Tabla donde se organizan las tareas -->
            <table style="font-family: 'Archivo Black';" class="table table-hover table-listado">

                <!-- Titulos de la tabla -->
                <thead>
                    <tr class="text-center">
                        <th><center>id</center></th>
                <th><center>Titulo</center></th>
                <th><center>Descripción</center></th>
                <th><center>Fecha de vencimiento</center></th>
                <th><center>Acciones</center></th>
                </tr>
                </thead>


                <!-- filas de la tabla -->
                <tbody>
                    <%
                        ServletContext context = getServletContext();

                        ControladorArchivos archivos = new ControladorArchivos();
                        ControladorDeTareas tareas = new ControladorDeTareas();

                        tareas.setListaTareas(archivos.leerListaTareas(context));
                        List<Tarea> listaTarea = tareas.obtenerTodasLasTareas();

                        if (listaTarea != null && !listaTarea.isEmpty()) {

                            for (Tarea t : listaTarea) {

                    %>
                    <tr class="text-center">
                        <td><center><%out.println(t.getId());%></center></td>
                <td><center><div class="custom-name-cell"><%out.println(t.getTitulo());%></div></center></td>
                <td><center><div class="custom-description-cell"><%out.println(t.getDescripcion());%></div></center></td>
                <td><center><%out.println(t.getFechaDeVencimiento());%></center></td>
                <td><center>


                    <!-- Boton para Editar Tarea -->
                    <a  class="btn btn-outline-warning" data-bs-toggle="editar" data-bs-target="#editar"><i class="fa-solid fa-pen"></i></a>                                        

                    <!-- Boton para Eliminar Tarea -->

                    <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%=t.getId()%>" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-trash"></i></a>                   

                </center>
                </td>
                </tr>

                <div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true" data-bs-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="taskModalLabel">Detalles de la Tarea</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-center">                 
                                <h4 style='color: #1c1c1c;'><strong>ID</strong></h4> <h4 style='color: #555555;' id="modalTaskId"></h4>
                                <h4 style='color: #1c1c1c;'><strong>Título</strong></h4> <h4 style='color: #555555;' id="modalTaskTitle"></h4>
                                <h4 style='color: #1c1c1c;'><strong>Descripción</strong></h4> <h4 style='color: #555555;' id="modalTaskDescription"></h4>
                                <h4 style='color: #1c1c1c;'><strong>Fecha de Vencimiento</strong></h4> <h4 style='color: #555555;' id="modalTaskDueDate"></h4>   
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal para la confirmacion de eliminar tarea -->

                <div class="modal fade" id="eliminar<%=t.getId()%>" tabindex="-1" role="dialog" aria-labelledby="eliminarModalLabel" aria-hidden="true" data-bs-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="eliminarModalLabel">Confirmar Eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar la tarea "<%=t.getTitulo()%>"?
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button> 
                                <!-- Agrega aquí un botón para realizar la eliminación -->
                                <a href="SvAgregarTareas?tipo=Eliminar&id=<%= t.getId()%>" class="btn btn-danger"  id="confirmarEliminacion">Eliminar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%                            }
                } else {


                %>

                <tr><% out.println("No hay perros");%> </tr>

                <%    }
                %>



                </tbody> 
            </table>
        </div>
    </div>  
</div> 
<!-- este script no permite que la tecla enter funcione dentro del textarea para evitar error en agregar tarea-->
<script>
    document.getElementById('descripcion').addEventListener('keydown', function (e) {
        if (e.key === 'Enter') {
            // Evitar el salto de línea
            e.preventDefault();
        }
    });
</script>
<script>

    // Obtén una referencia al campo de descripción y al elemento para mostrar el contador.
    var descripcionField = document.getElementById("descripcion");
    var wordCount = document.getElementById("wordCount");

    // Establece el límite de palabras.
    var maxWords = 20;

    descripcionField.addEventListener("input", function (e) {
        // Divide el contenido del campo de descripción en palabras y cuenta la longitud del array resultante.
        var words = descripcionField.value.trim().split(/\s+/);
        var wordCountValue = words.length;

        // Actualiza el contador de palabras.
        wordCount.textContent = wordCountValue + " palabras de " + maxWords + " (máximo)";

        // Si se excede el límite, recorta el contenido y cambia el color del mensaje.
        if (wordCountValue > maxWords) {
            // Recorta el contenido para que tenga el número máximo de palabras.
            descripcionField.value = words.slice(0, maxWords).join(" ");
            wordCount.textContent = maxWords + " palabras de " + maxWords + " (máximo)";
            wordCount.style.color = "#888"; // Cambia el color al gris claro que desees.
            wordCount.classList.add("wordCountMessage"); // Agrega la clase para cambiar el color.
        } else {
            wordCount.style.color = "#888"; // Restaura el color original si no se excede el límite.
            wordCount.classList.remove("wordCountMessage"); // Elimina la clase si no se excede el límite.
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        // Función para realizar la búsqueda y mostrar la información en la ventana modal
        $("#searchButton").click(function () {
            var searchTerm = $("#searchInput").val().trim();
            if (searchTerm !== "") {
                // Realizar la búsqueda de la tarea por nombre
                var taskFound = false;
                $(".custom-name-cell").each(function () {
                    if ($(this).text().toLowerCase().includes(searchTerm.toLowerCase())) {
                        taskFound = true;
                        var taskId = $(this).closest("tr").find("td:first-child").text();
                        var taskTitle = $(this).text();
                        var taskDescription = $(this).closest("tr").find(".custom-description-cell").text();
                        var taskDueDate = $(this).closest("tr").find("td:nth-child(4)").text();

                        // Actualizar el contenido de la modal
                        $("#modalTaskId").text(taskId);
                        $("#modalTaskTitle").text(taskTitle);
                        $("#modalTaskDescription").text(taskDescription);
                        $("#modalTaskDueDate").text(taskDueDate);

                        // Mostrar la modal
                        $("#taskModal").modal("show");
                        return false;
                    }
                });

                if (!taskFound) {
                    // Manejar el caso en el que no se encontraron tareas
                    alert("No se encontraron tareas con el nombre proporcionado.");
                }
            } else {
                // Manejar el caso en el que el campo de búsqueda está vacío
                alert("Ingrese un nombre para buscar tareas.");

            }
        });
    });
</script>
<script>

</script>
<!-- este script hace que el texto de la descripción se ajuste al siguiente renglón mostrando en la modal de buscar-->

<style>
    #modalTaskDescription {
        word-wrap: break-word;
    }
</style>


<%@include file="Templates/footer.jsp"%>