/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Controlador.ControladorArchivos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Usuario;
import Controlador.ControladorDeUsuarios;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvRegistrar", urlPatterns = {"/SvRegistrar"})
public class SvRegistrar extends HttpServlet {

    Usuario usuario = new Usuario();
    ControladorDeUsuarios usuarioCont = new ControladorDeUsuarios();
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
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        try {
            // Obtener los parámetros de la solicitud y validarlos
            String cedulaParam = request.getParameter("cedula");
            String nombreUsuarioParam = request.getParameter("correo");
            String contrasenaParam = request.getParameter("contrasena");

            if (cedulaParam == null || nombreUsuarioParam == null || contrasenaParam == null) {
                throw new IllegalArgumentException("Los parámetros de la solicitud son incorrectos.");
            }

            int cedula = Integer.parseInt(cedulaParam);

            // Crear un objeto Usuario con los datos validados
            Usuario usuario = new Usuario(cedula, nombreUsuarioParam, contrasenaParam);

            // Acceder a la lista de usuarios desde el contexto de la aplicación
            ServletContext context = getServletContext();
            ArrayList<Usuario> listaUsuarios = archivos.leerListaUsuarios(context);
            

            if (listaUsuarios == null) {
                listaUsuarios = new ArrayList<>();
            }

            // Agregar el nuevo usuario a la lista
            listaUsuarios.add(usuario);
            usuarioCont.setListaUsuarios(listaUsuarios);
            archivos.guardarListaUsuarios(listaUsuarios, context);
            

            // Guardar la lista actualizada de usuarios en el contexto de la aplicación
            context.setAttribute("listaUsuarios", listaUsuarios);
            // Después de agregar el usuario a la lista y antes de redirigir
            request.getSession().setAttribute("registroExitoso", true);
            // Redirigir al usuario a la página "index.jsp"
            response.sendRedirect("index.jsp");

        } catch (NumberFormatException e) {
            // Manejar errores de conversión de número
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cédula inválida.");
        } catch (IllegalArgumentException e) {
            // Manejar errores de parámetros de solicitud incorrectos
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            // Manejar otros errores
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
