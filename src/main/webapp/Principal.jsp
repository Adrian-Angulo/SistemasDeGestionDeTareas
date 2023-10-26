<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControladorArchivos"%>
<%@page import="Controlador.ControladorDeTareas"%>
<!-- se importa clase de estilos unica para Principal.jsp -->
<link rel="stylesheet" type="text/css" href="estilos/stylePrincipal.css">
<%@include file="Templates/header.jsp"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary my-form2">
    <div style="font-family: 'Archivo Black';" class="container">
        <div class="container">
            <a class="navbar-brand">
                <img src="Imagenes/portapapeles.png" alt="Logo" width="60" height="40" class="d-inline-block align-text-top">
                Gestion de Tareas
            </a>
            
        </div>


        <div class="navbar bg-body-tertiary" id="navbarSupportedContent">           
            <!-- opcion de salir o cerrar sesion -->
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
        <!-- clase division por 4 columnas -->
        <div class="col-md-4"> 


            <!-- alerta que se agrego una nueva tarea-->


            <% if (request.getSession().getAttribute("alertaAgregar") != null && (boolean) request.getSession().getAttribute("alertaAgregar") == true) { %>
            <div class="toast fade show  position-fixed bottom-0 end-0 p-3" role="alert" aria-live="assertive"id="registroExitosoAlert" style="text-align: center; size: 28px">
                <div class="toast-body">
                    <label>Se agrego una nueva tarea</label>
                </div>
            </div>

            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#registroExitosoAlert').alert('close');
                }, 4000);
            </script>
            <% request.getSession().removeAttribute("alertaAgregar"); %>
            <% } %>

            <!-- alerta que se elimino una tarea-->


            <% if (request.getSession().getAttribute("alertaEliminar") != null && (boolean) request.getSession().getAttribute("alertaEliminar") == true) { %>
            <div class="toast fade show  position-fixed fixed-bottom fixed-left p-3" id="registroExitosoAlert" style="text-align: center; size: 28px">
                <div class="toast-body">
                    <label>Se elimino una tarea</label>
                </div>
            </div>

            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#registroExitosoAlert').alert('close');
                }, 4000);
            </script>
            <% request.getSession().removeAttribute("alertaEliminar"); %>
            <% } %>


            <!-- alerta que se edito una tarea-->


            <% if (request.getSession().getAttribute("alertaEditar") != null && (boolean) request.getSession().getAttribute("alertaEditar") == true) { %>
            <div class="toast fade show  position-fixed fixed-bottom fixed-left p-3" id="registroExitosoAlert" style="text-align: center; size: 28px">
                <div class="toast-body">
                    <label>Se edito una tarea</label>
                </div>
            </div>

            <script>
                // Ocultar la alerta después de 5 segundos (5000 milisegundos)
                setTimeout(function () {
                    $('#registroExitosoAlert').alert('close');
                }, 4000);
            </script>
            <% request.getSession().removeAttribute("alertaEditar"); %>
            <% } %>





            <!-- las siguientes alertas fueron ubicadas en este lugar para mostrarlas sobre el formulario de agregar tareas -->
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

            <div id="mensajeConfirmacion" style="display: none;" class="alert alert-success">
                Tabla ordenada de manera descendente por ID.
            </div>


            <div class="card card-body my-form">
                <!-- tarjeta de trabajo -->
                <h3 class="text-center">Agregar Tarea</h3>
                <!-- Formulario que conecta con el servlet y manda por el metodo POST especificamos enctype para 
                manejar el formulario que manda el FILE. Basado: https://es.stackoverflow.com/questions/48643/como-guardar-imagen-en-proyecto-servlet
                -->
                <form action="SvAgregarTareas" method="POST" class="my-form">

                    <!-- Id -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Id</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <!--<input type="text" name="id" placeholder="Id de la tarea" class="form-control" required><br>-->
                        <input type="number" name="id" id="id" placeholder="Id de la tarea" class="form-control" required min="1">
                    </div>
                    <span id="idError" style="color: red; font-size: 13px;"></span>
                    <!-- Titulo -->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Titulo</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="titulo" placeholder="Titulo de tu tarea" class="form-control" required><br>
                    </div>

                    <!-- Descripción -->
                    <div class="form-floating centered-textarea">
                        <textarea class="form-control responsive-textarea" placeholder="Descripcion" name="descripcion" id="descripcion" style="height: 120px;" required></textarea>
                        <label for="descripcion">Descripcion</label>

                    </div>
                    <div class="wordCountMessage" id="wordCount" > Tienes un maximo de 20 palabras</div><br>

                    <!-----fecha de vencimiento-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"> Fecha de vencimiento</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="date" name="fecha" class="form-control" required><br>
                    </div>

                    <!-----Agregar despues De una tarea-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"> Agregar despues de </span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" id="despues" name="despues" class="form-control" placeholder="Titulo de tarea"><br>
                    </div>

                    <!-----Agregar antes De una tarea-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"> Agregar Antes de </span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" id="antes" name="antes" class="form-control" placeholder="Titulo de tarea"><br>
                    </div>

                    <!-- inicio Bontones de agregar primero y ultimo -->
                    <div class="text-center" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="agregar" value="Primero" id="btnradio1" autocomplete="off">
                        <label class="btn btn-outline" for="btnradio1"> Agregar de Primera </label>

                        <input type="radio" class="btn-check" name="agregar" value="Ultimo" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline" for="btnradio2"> Agregar de Ultima </label>

                        <!-- icono para limpiar seleccion de botones si se desea  -->
                        <button type="button" class="btn btn-outline" id="limpiarSeleccion">
                            <i class="fas fa-times"></i>
                        </button>
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
                    <a class="navbar-brand"> Lista de tareas </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- nav bar para manejar botones  -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Ordenar
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="d-flex justify-content-center">
                                        <button id="ordenarPorIdAscendente" class="btn">ID Ascendente</button>

                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <!-- Botón de ordenamiento descendente -->
                                    <li class="d-flex justify-content-center">
                                        <button id="ordenarPorIdDescendente" class="btn">ID Descendente</button>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li class="d-flex justify-content-center">
                                        <button id="ordenarPorFechaAscendente" class="btn">Fecha Ascendente</button>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>   
                                    <li class="d-flex justify-content-center">
                                        <button id="ordenarPorFechadescendente" class="btn">Fecha Descendente</button>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li> 
                                    <li class="d-flex justify-content-center">
                                        <button id="recargarPagina" class="btn">Restablecer</button>
                                    </li>

                                </ul>
                            </li>
                        </ul>

                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" id="searchInput" placeholder="Buscar por ID" aria-label="Search">
                            <button class="btn btn-outline-success" type="button" id="searchButton">Buscar</button>
                        </form>
                    </div>
                </div>
            </nav>
            <!-- Tabla donde se organizan las tareas -->
            <%
                ServletContext context = getServletContext();

                ControladorArchivos archivos = new ControladorArchivos();
                ControladorDeTareas tareas = new ControladorDeTareas();

                tareas.setListaTareas(archivos.leerListaTareas(context));
                List<Tarea> listaTarea = tareas.obtenerTodasLasTareas();

                int numeroDeTareas = listaTarea.size();

            %>

            <div class="text-center ">
                <p class="fs-5">existen <%= numeroDeTareas%> tareas registradas</p>
            </div>

            <table style="font-family: 'Archivo Black';  " class="table table-hover table-listado" id="tablaTareas">

                <!-- Títulos de la tabla -->
                <thead>
                    <tr class="text-center">
                        <th><center>id</center></th>
                <th><center>Titulo</center></th>
                <th><center>Descripción</center></th>
                <th><center>Fecha de vencimiento</center></th>
                <th><center>Acciones</center></th>
                </tr>
                </thead>  

                <!-- filas de la tabla a mostrar -->
                <tbody>
                    <%                        if (listaTarea != null && !listaTarea.isEmpty()) {

                            for (Tarea t : listaTarea) {

                    %>
                    <tr class="text-center">
                        <td><center><%out.println(t.getId());%></center></td>
                <td><center><div class="custom-name-cell"><%out.println(t.getTitulo());%></div></center></td>
                <td><center><div class="custom-description-cell"><%out.println(t.getDescripcion());%></div></center></td>
                <td><center><%out.println(t.getFechaDeVencimiento());%></center></td>
                <td>
                <center>
                    <!-- Boton para Editar Tarea -->
                    <a  class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#editar<%=t.getId()%>" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-pen"></i></a>                                            
                    <!-- Boton para Eliminar Tarea -->
                    <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%=t.getId()%>" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-trash"></i></a>                  
                </center>
                </td>
                </tr>

                <!-- Modal para mostrar la alerta -->
                <div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true" data-bs-backdrop="static">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="alertModalLabel">Alerta</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p style="color: red;" id="alertMessage"></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- modal para mostrar la informacion de la tarea buscada-->
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
                                <!-- Boton para Editar Tarea -->
                                <a  class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#editar<%=t.getId()%>" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-pen"></i></a>
                                <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar<%=t.getId()%>" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-trash"></i></a>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para la Modificacion de una tarea -->

                <div class="modal fade" id="editar<%=t.getId()%>" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true" data-bs-backdrop="static">

                    }
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="eliminarModalLabel">Editar Tarea</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="SvAgregarTareas" method="GET">

                                    <!-- Id -->
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">Id</span>
                                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                                        <input type="text" name="id" placeholder="Id de la tarea" value="<%= t.getId()%>" class="form-control" required readonly><br>
                                    </div>

                                    <!-- Titulo -->
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">Titulo</span>
                                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                                        <input type="text" name="titulo" placeholder="Titulo de tu tarea" value="<%= t.getTitulo()%>" class="form-control" required><br>
                                    </div>

                                    <!-- Descripción -->
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Descripcion" name="descripcion"  id="descripcion" style="width: 100%; max-width: 395px; height: 120px;" required><%= t.getDescripcion()%></textarea>
                                        <label for="descripcion">Descripcion</label>
                                        <div class="wordCountMessage" id="wordCount" >Tienes un maximo de 20 palabras</div>
                                    </div><br>

                                    <!-----fecha de vencimiento-->
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">Fecha de vencimiento</span>
                                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                                        <input type="date" name="fecha" class="form-control" value="<%= t.getFechaDeVencimiento()%>"required><br>
                                    </div>

                                    <div class="modal-footer">
                                        <!-- Campo oculto para el tipo "Editar" -->
                                        <input type="hidden" name="tipo" value="Editar">
                                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button> 
                                        <!-- Agrega aquí un botón para realizar la eliminación -->
                                        <button type="submit"  class="btn btn-success" data-bs-dismiss="modal">Editar</button> 

                                    </div>
                                </form>
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
                <tr>
                    <td>
                        <div style='text-align: center;'>
                            <%out.println("No hay Tareas registradas");%>
                        </div> 
                    </td>
                </tr>
                <%    }
                %>
                </tbody> 
            </table>
        </div>
    </div>  
</div> 

<%@include file="Templates/footer.jsp"%>