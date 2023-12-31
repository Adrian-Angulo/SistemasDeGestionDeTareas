/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controlador.ControladorDeUsuarios;
import Controlador.ControladorArchivos;
import Modelo.Usuario;
import javax.servlet.ServletContext;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvInicioSesion", urlPatterns = {"/SvInicioSesion"})
public class SvInicioSesion extends HttpServlet {

    ControladorDeUsuarios controladorDeUsuario = new ControladorDeUsuarios();
    ControladorArchivos archivos = new ControladorArchivos();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * En este metodo doGet se realiza el cierre de sesion con el atributo invalidate para despues hacer
     * la redireccion a la pagina del login o index.jsp
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //metodos agregados para hacer el cierre de sesion
        // Invalida la sesión actual
        request.getSession().invalidate();

        // Redirige al usuario a la página de inicio de sesión o a otra página de tu elección
        response.sendRedirect("index.jsp"); // Puedes cambiar la URL según tus necesidades
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext context = getServletContext();
        controladorDeUsuario.setListaUsuarios(archivos.leerListaUsuarios(context));

        final String usuario = request.getParameter("correo").trim(); // recibir el usuario 
        final String contrasena = request.getParameter("contrasena").trim(); // recibir la contraseña 

        System.out.println(usuario);
        System.out.println(contrasena);
        //validar si el usuario se encuentra encuentra registrado  para iniciar seccion para ello se llama al metodo autenticarUsuario

        if (controladorDeUsuario.autenticarUsuario(usuario, contrasena)) {
            Usuario user = controladorDeUsuario.obtenerUsuarioPorCorreo(usuario);
            request.getSession().setAttribute("usuario",user.getNombreUsuario() );

            System.out.println("El usuario a iniciado seccion");
            request.getRequestDispatcher("Principal.jsp").forward(request, response);// si el usuariio existe se redirecciona a la pagina Principal
        } else {

            // Si el inicio de sesión falla, configura el atributo de solicitud "inicioSesionFallido"
            request.setAttribute("inicioSesionFallido", true);
            // Redirigir de nuevo a la página de inicio (index.jsp) con el mensaje de error
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
