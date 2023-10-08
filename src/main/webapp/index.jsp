<%-- 
    Document   : index
    Created on : 4 oct. 2023, 16:49:35
    Author     : ADRIAN CASTILLO
--%>


<%@include file="Templates/header.jsp"%>
<link rel="stylesheet" type="text/css" href="estilos/style.css">
<div class="container" id="container">
	<div class="form-container sign-up-container">
            <form action="RegistratSv" method="POST">
			<h1>Registrate</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<span>O utiliza tu correo electrónico para registrarte</span>
                        <input type="text" placeholder="Cedula" name="cedula" />
                        <input type="email" placeholder="Correo electronico" name="correo" />
			<input type="password" placeholder="Contraseña" name="contrasena" />
                        <button type="submit">Registrar</button>
		</form>
	</div>    
	<div class="form-container sign-in-container">
            <!-- redireccion con servlet -->
            <form action="InicioSeccionSv" method="POST">
			<h1>Sistema de Gestión de Tareas</h1>
			<div class="social-container">
                           
				<a href="https://www.facebook.com/esneyder.ibarra.brrr" class="social"><i class="fa-brands fa-facebook"></i></a>
				<a href="https://www.instagram.com/esneydrsxual/" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="https://www.instagram.com/esneydrsxual/" class="social"><i class="fa-brands fa-instagram"></i></a>
			</div>
			<span>Usa tu cuenta</span>
                        <input type="email" placeholder="correo electrónico" name="correo" />
                        <input type="password" placeholder="Contraseña" name="contrasena" />
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
<%@include file="Templates/footer.jsp"%>