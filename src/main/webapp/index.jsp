<%-- 
    Document   : index
    Created on : 4 oct. 2023, 16:49:35
    Author     : ADRIAN CASTILLO
--%>

<%@include file="Templates/header.jsp"%>
<link rel="stylesheet" type="text/css" href="estilos/style.css">
<!-- alerta o notificacion para indicar que el usuario ha sido guardado exitosamente-->
 <% if (request.getSession().getAttribute("registroExitoso") != null && (boolean)request.getSession().getAttribute("registroExitoso")) { %>
        <div class="alert alert-success alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
            ¡Registro exitoso! Puede iniciar sesión ahora.
        </div>
        <script>
            // Ocultar la alerta después de 5 segundos (5000 milisegundos)
            setTimeout(function() {
                $('#registroExitosoAlert').alert('close');
            }, 3000);
        </script>
        <% request.getSession().removeAttribute("registroExitoso"); %>
    <% } %>
    
    
<div class="container" id="container">
    <div class="form-container sign-up-container">              
        <!-- Formulario para Registrarse si eres nuevo -->
        <form action="SvRegistrar" method="POST">            
            <h1>Registrate</h1>
            <div class="social-container">
                <a href="https://www.facebook.com/?locale=es_LA" class="social"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Dsign_in_no_continue%26pli%3D1&ec=GAlAwAE&hl=es&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S-569584909%3A1696817722023235&theme=glif" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="https://www.instagram.com/accounts/login/" class="social"><i class="fa-brands fa-instagram"></i></a>
            </div>
            <span>O utiliza tu correo electrónico para registrarte</span>
            <input type="text" placeholder="Cedula" name="cedula" id="cedula" required/>
<span id="cedulaError" style="color: red;"></span>
            <input type="email" placeholder="Correo electronico" name="correo" required/>     
 
   <div class="input-group">
    <input type="password" placeholder="Contraseña" name="contrasena" id="contrasenaInput2" required/>
    <div class="input-group-append2">
        <button class="btn btn-outline-secondary p-1" type="button" id="togglePassword2">
            <i class="far fa-eye-slash" id="eyeIcon2"></i>
        </button>
    </div>
</div>


            
            <button type="submit">Registrar</button>
        </form>
    </div>    
    <div class="form-container sign-in-container">
      

        <!-- redireccion con servlet -->
        <form action="SvInicioSesion" method="POST">
            <h1>Sistema de Gestión de Tareas</h1>
            <div class="social-container">

                <a href="https://www.facebook.com/?locale=es_LA" class="social"><i class="fa-brands fa-facebook"></i></a>
                <a href="https://accounts.google.com/v3/signin/identifier?authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Dsign_in_no_continue%26pli%3D1&ec=GAlAwAE&hl=es&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession&dsh=S-569584909%3A1696817722023235&theme=glif" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="https://www.instagram.com/accounts/login/" class="social"><i class="fa-brands fa-instagram"></i></a>
            </div>
            <span>Usa tu cuenta</span>
            <input type="email" placeholder="correo electrónico" name="correo" required/>                  


<div class="input-group">
    <input type="password" placeholder="Contraseña" name="contrasena" id="contrasenaInput" required/>
    <div class="input-group-append">
        <button class="btn btn-outline-secondary p-0" type="button" id="togglePassword">
            <i class="far fa-eye-slash" id="eyeIcon"></i>
        </button>
    </div>
</div>




            
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

    <footer>
        <p>Dirección: Cl 10 #25-468 Ed.Bosquesitos     Teléfono: (602) 7246385     Email:gestionEmpleados@tuempresa.com</p> 
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
    // Selecciona el campo de cédula y el elemento del mensaje de error
    const cedulaInput = document.getElementById("cedula");
    const cedulaError = document.getElementById("cedulaError");

    // Agrega un event listener para el evento "input" que se dispara cuando se ingresa texto
    cedulaInput.addEventListener("input", function () {
        const cedulaValue = cedulaInput.value;

        // Verifica si la longitud es mayor que 10 caracteres
        if (cedulaValue.length > 10) {
            cedulaError.textContent = "La cédula no puede exceder los 10 dígitos.";
            cedulaInput.setCustomValidity("La cédula no puede exceder los 10 dígitos.");
        } else {
            // Si la longitud es válida, borra el mensaje de error
            cedulaError.textContent = "";
            cedulaInput.setCustomValidity("");
        }
    });
</script>
<script>
    const contrasenaInput = document.getElementById("contrasenaInput");
    const togglePasswordButton = document.getElementById("togglePassword");
    const eyeIcon = document.getElementById("eyeIcon");

    togglePasswordButton.addEventListener("click", function () {
        if (contrasenaInput.type === "password") {
            contrasenaInput.type = "text";
            eyeIcon.classList.remove("far", "fa-eye-slash");
            eyeIcon.classList.add("far", "fa-eye");
        } else {
            contrasenaInput.type = "password";
            eyeIcon.classList.remove("far", "fa-eye");
            eyeIcon.classList.add("far", "fa-eye-slash");
        }
    });
</script>
<script>
    const contrasenaInput2 = document.getElementById("contrasenaInput2");
    const togglePasswordButton2 = document.getElementById("togglePassword2");
    const eyeIcon2 = document.getElementById("eyeIcon2");

    togglePasswordButton2.addEventListener("click", function () {
        if (contrasenaInput2.type === "password") {
            contrasenaInput2.type = "text";
            eyeIcon2.classList.remove("far", "fa-eye-slash");
            eyeIcon2.classList.add("far", "fa-eye");
        } else {
            contrasenaInput2.type = "password";
            eyeIcon2.classList.remove("far", "fa-eye");
            eyeIcon2.classList.add("far", "fa-eye-slash");
        }
    });
</script>
<script>
    // Esta función se ejecutará cuando se cargue la página
    window.onload = function () {
        // Obtén una referencia a los campos de entrada que deseas limpiar
        const cedulaInput = document.getElementById("cedula");
        const correoInput = document.querySelector('input[name="correo"]');
        const contrasenaInput1 = document.getElementById("contrasenaInput");
        const contrasenaInput2 = document.getElementById("contrasenaInput2");

        // Restablece los valores de los campos de entrada
        cedulaInput.value = "";
        correoInput.value = "";

        // Comprueba si la página se cargó después de un registro exitoso
        const registroExitosoAlert = document.getElementById("registroExitosoAlert");
        if (!registroExitosoAlert) {
            correoInput.value = "";
            contrasenaInput1.value = "";
            contrasenaInput2.value = "";
        }
    };
</script>




    <%@include file="Templates/footer.jsp"%>