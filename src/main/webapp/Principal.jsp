<%-- 
    Document   : Principal
    Created on : 7 oct. 2023, 19:57:57
    Author     : ADRIAN CASTILLO
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.ControladorArchivos"%>
<%@page import="Controlador.ControladorDeTareas"%>

<%@include file="Templates/header.jsp"%>
<!-- nav bar  -->





<div class="container p-4"> 

    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body"> <!-- tarjeta de trabajo -->


                <h3>Agregar Tarea</h3>
                <!-- Formulario que conecta con el servlet y manda por el metodo POST especificamos enctype para 
                manejar el formulario que manda el FILE. Basado: https://es.stackoverflow.com/questions/48643/como-guardar-imagen-en-proyecto-servlet
                -->
                <form action="SvAgregarTareas" method="POST" >

                    <!-- Formulario basado de: https://getbootstrap.com/docs/5.3/forms/input-group/  --> 

                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Titulo:</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="text" name="titulo" class="form-control" ><br>
                    </div>


                    <!-----Descripcion-->
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Descripcion" name="descripcion" id="floatingTextarea"></textarea>
                        <label for="floatingTextarea">Descripcion</label>
                    </div><br>

                    <!-----fecha de vencimiento-->
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">Fecha de vencimiento:</span>
                        <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                        <input type="date" name="fecha" class="form-control" required><br>
                    </div>


                    <input  class="btn btn-success" type="submit" value="Agregar">
                </form>
            </div> 
        </div> 




        <!-- Creamos la tabla interactiva -->

        <div class="col-md-8">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Gestion de tareas</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>


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
                            <input class="form-control me-2" type="search" placeholder="Buscar por nombre" aria-label="Search" required>
                            <button class="btn btn-outline-success" type="submit">Buscar</button>
                        </form>
                    </div>
                </div>
            </nav>

            <!-- Tabla donde se organizan las tareas -->
            <table class="table table-hover">

                <!-- Titulos de la tabla -->
                <thead>
                    <tr>
                        <th><center>id</center></th>
                <th><center>Titulo</center></th>
                <th><center>Descripcion</center></th>
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
                        ArrayList<Tarea> listaTarea = tareas.obtenerTodasLasTareas();

                        if (listaTarea != null && !listaTarea.isEmpty()) {

                            for (Tarea t : listaTarea) {

                    %>
                    <tr>

                <td><center><%out.println(t.getId());%></center></td>
                <td><center><%out.println(t.getTitulo());%></center></td>
                <td><center><%out.println(t.getDescripcion());%></center></td>
                <td><center><%out.println(t.getFechaDeVencimiento());%></center></td>
                <td><center>


                    <!-- Boton para Editar Tarea -->
                    <a  class="btn btn-outline-warning" data-bs-toggle="editar" data-bs-target="#editar"><i class="fa-solid fa-pen"></i></a>                                        

                    <!-- Boton para Eliminar Tarea -->

                    <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar" data-nombre="<%=t.getTitulo()%>"><i class="fa-solid fa-trash"></i></a>

                </center>
                </td>
                </tr>
                
                
                <!<!-- Modal para la confirmacion de eliminar tarea -->
                
                <div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="eliminarModalLabel">Confirmar Eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                                </button>
                            </div>
                            <div class="modal-body">
                                ¿Estás seguro de que deseas eliminar la tarea  con titulo <%=t.getTitulo() %>?
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button> 
                                <!-- Agrega aquí un botón para realizar la eliminación -->
                                <a href="SvAgregarTareas?tipo=Eliminar&id=<%= t.getId()%>" class="btn btn-outline-danger"  id="confirmarEliminacion">Eliminar</a>
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

<%@include file="Templates/footer.jsp"%>
