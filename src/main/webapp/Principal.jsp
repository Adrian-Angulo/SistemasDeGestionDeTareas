<%-- 
    Document   : Principal
    Created on : 7 oct. 2023, 19:57:57
    Author     : ADRIAN CASTILLO
--%>

<%@include file="Templates/header.jsp"%>
    <!-- Example Code -->
    
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" aria-disabled="true">Disabled</a>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
    


    <div class="container p-4"> 
            
    <div class="row">
    <div class="col-md-4">  <!-- clase division por 4 columnas -->
        <div class="card card-body"> <!-- tarjeta de trabajo -->
            <h3>Agregar Tarea</h3>
            <!-- Formulario que conecta con el servlet y manda por el metodo POST especificamos enctype para 
            manejar el formulario que manda el FILE. Basado: https://es.stackoverflow.com/questions/48643/como-guardar-imagen-en-proyecto-servlet
            -->
            <form action="SvCanino" method="POST" enctype="multipart/form-data">
                
              <!-- Formulario basado de: https://getbootstrap.com/docs/5.3/forms/input-group/  --> 
              
              <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Titulo:</span>
                 <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
                <input type="text" name="nombre" class="form-control" ><br>
              
              </div>


              <!-----Descripcion-->
              <div class="form-floating">
              <textarea class="form-control" placeholder="Descripcion" id="floatingTextarea"></textarea>
              <label for="floatingTextarea">Descripcion</label>

            </div><br>

            <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Fecha de vencimiento:</span>
             <!-- Aqui se obtiene el identificador unico, por lo que es necesario que al momento de presionar el boton de editar esta no se vuelva modificable -->
            <input type="date" name="nombre" class="form-control" ><br>
          
          </div>

              
                    




            <div class="col-12">

                <!--Basado: https://getbootstrap.com/docs/5.3/components/buttons/ -->

                <input  class="btn btn-success" type="submit" name="accion" value="Agregar">
                
            </div>
    </div> </div> </form> <br>

<!-- Creamos la tabla interactiva -->

<div class="col-md-8">
    <table class="table table-hover">
        <thead>
            <tr>
                <th><center>id</center></th>
                <th><center>Titulo</center></th>
                <th><center>Descripcion</center></th>
                <th><center>Fecha de vencimiento</center></th>

            </tr>
        </thead>
        <tbody>


            <tr>
                <td><center></center> </td>
                <td><center></td>



                <td><center></center></td>
                <td><center> </center></td>
                <td><center></center></td>
                <td><center>
                   

                    <!-- Editar Tarea -->
                    <a  class="btn btn-outline-warning" data-bs-toggle="editar" data-bs-target="#editar"><i class="fa-solid fa-pen"></i></a>                                        

                    <!-- Eliminar Tarea -->
                  
                    <a href="#" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminar"><i class="fa-solid fa-trash"></i></a>
                    </center>
                </td>
            </tr> 
            

 


      


        </tbody> 
    </table>
</div>
</div>  
</div> 

<%@include file="Templates/footer.jsp"%>