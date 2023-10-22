<%@include file="Templates/header.jsp"%>
<link rel="stylesheet" type="text/css" href="estilos/style.css">

<!-- alerta o notificacion para indicar que el usuario ha sido registrado exitosamente -->
<% if (request.getSession().getAttribute("registroExitoso") != null && (boolean) request.getSession().getAttribute("registroExitoso") == true) { %>
<div class="alert alert-success alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
    ¡Registro exitoso! Puede iniciar sesión ahora.
</div>
<% request.getSession().removeAttribute("registroExitoso"); %>
<% } %>

<!-- alerta o notificacion para indicar que el usuario no ha sido registrado-->
<% if (request.getSession().getAttribute("registroExitoso") != null && (boolean) request.getSession().getAttribute("registroExitoso") == false) { %>
<div class="alert alert-danger alert-dismissible fade show small-text" role="alert" id="registroExitosoAlert">
    ¡Registro Fallido! el usuario ya se encuentra registrado en el sistema.
</div>
<% request.getSession().removeAttribute("registroExitoso"); %>
<% }%>

<!-- alerta o notificacion para indicar que el usuario no ha sido encontrado-->
<% if (request.getAttribute("inicioSesionFallido") != null) { %>
<div class="alert alert-danger" role="alert" id="error-alert">
    ¡Ups! la cuenta no existe o los datos son incorrectos. Por favor, verifica la información.
</div>
<% request.removeAttribute("inicioSesionFallido"); %>  
<% }%>

    
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
            <span>O utiliza tu información para registrarte</span>
            <input type="text" placeholder="Cedula" name="cedula" id="cedula" required pattern="[0-9]+"/>
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
             <span id="errorMensaje" style="color: red;"></span>
          <button type="submit" onclick="return validarContraseña();">Registrar</button>
        </form>
        <!------------------------------------------>
    </div>    
    <div class="form-container sign-in-container">
        <!-- Formulario de inicio de sesion -->
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
            <!------------------Ingersar el formulario de Inicio Sesion------------------------>
            <div class="overlay-panel overlay-left">
                <h1>Bienvenido de nuevo!</h1>
                <p>Para mantenerse conectado con nosotros, inicie sesión con su información personal</p>
                <button class="ghost" id="signIn">Iniciar sesión</button>
            </div>
            <!------------------Ingersar el formulario de Registro------------------------>
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
    <%@include file="Templates/footer.jsp"%>