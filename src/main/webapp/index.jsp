<%-- 
    Document   : index
    Created on : 4 oct. 2023, 16:49:35
    Author     : ADRIAN CASTILLO
--%>


<%@include file="Templates/header.jsp" %>
<section class="h-100 gradient-form" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                         style="width: 185px;" alt="logo">
                                    <h4 class="mt-1 mb-5 pb-1">Sistema de Gestión de Tareas </h4>
                                </div>

                                <form>
                                    

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example11">Usuario</label>
                                        <input type="email" id="form2Example11" class="form-control"
                                               placeholder="Número de teléfono o correo electrónico" />
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example22">Contraseña</label>
                                        <input type="password" id="form2Example22" class="form-control" />
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button">Log
                                            in</button> <br>
                                        <a class="text-muted" href="#!">¿Olvidó su contraseña?</a>
                                    </div>
                                    <div class="text-center pt-1 mb-3 pb-1"> <!-- Modificación en la clase mb-5 -->
                                        
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">¿No tienes una cuenta?</p>
                                        <button type="button" class="btn btn-outline-danger">Registrarse</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <h4 class="mb-4">Sistema de Gestión de Tareas</h4>
                                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="Templates/footer.jsp" %>
