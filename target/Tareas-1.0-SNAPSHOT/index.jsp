<%-- 
    Document   : index
    Created on : 4 oct. 2023, 16:49:35
    Author     : ADRIAN CASTILLO
--%>

<%@include file="Templates/header.jsp"%>
<link rel="stylesheet" type="text/css" href="estilos/style.css">

<div class="container" id="container">
    <div class="form-container sign-up-container">
        <!-- Formulario para Registrarse si eres nuevo -->
        <form action="SvRegistrar" method="POST">
            <h1>Registrate</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>O utiliza tu correo electrónico para registrarte</span>
            <input type="text" placeholder="Cedula" name="cedula" required/>
            <input type="email" placeholder="Correo electronico" name="correo" required/>
            <input type="password" placeholder="Contraseña" name="contrasena" required/>
            <button type="submit">Registrar</button>
        </form>
    </div>    
    <div class="form-container sign-in-container">
        <!-- redireccion con servlet -->
        <form action="SvInicioSesion" method="POST">
            <h1>Sistema de Gestión de Tareas</h1>
            <div class="social-container">

                <a href="https://www.facebook.com/esneyder.ibarra.brrr" class="social"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://www.instagram.com/esneydrsxual/" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="https://www.instagram.com/esneydrsxual/" class="social"><i class="fa-brands fa-instagram"></i></a>
            </div>
            <span>Usa tu cuenta</span>
            <input type="email" placeholder="correo electrónico" name="correo" required/>
            <input type="password" placeholder="Contraseña" name="contrasena" required />
            <a href="Principal.jsp">Olvidaste tu contraseña?</a>

            <button type="submit"> Iniciar sesión</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Bienvenido de nuevo!</h1>
                <p>Para mantenerse conectado con nosotros, inicie sesión con su información personal</p>
                <button class="ghost" id="signIn">Iniciar sesión</button>
            </div>


            <div class="overlay-panel overlay-right">
                <h1>Hola, bienvenido/a!</h1>
                <p>Ingresa tus datos personales y comienza tu viaje con nosotros.</p>
                <button class="ghost" id="signUp">Registrarme</button>
            </div>
        </div>
    </div>
    <div class="modal fade" id="registroExitosoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center"> <!-- Agrega la clase text-center aquí -->
                    <h5 class="modal-title" id="exampleModalLabel">Registro Exitoso</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    El usuario ha sido registrado correctamente.
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-danger btn-success mx-2" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <p>
            Que podemos agg en este footer 
        </p>
    </footer>
    <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
    </script>
    <script>
    // Mostrar la alerta modal si se ha registrado correctamente (simulado aquí)
        const formularioRegistro = document.querySelector('form[action="SvRegistrar"]');
        formularioRegistro.addEventListener('submit', function (e) {
            e.preventDefault(); // Evitar que el formulario se envíe realmente

            // Simula un registro exitoso aquí (puedes modificar esta parte según tu lógica)
            const registroExitoso = true;

            if (registroExitoso) {
                $('#registroExitosoModal').modal('show'); // Mostrar la modal usando Bootstrap
            }
        });

    </script>
    <%@include file="Templates/footer.jsp"%>