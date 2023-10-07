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

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "InicioSeccionSv", urlPatterns = {"/InicioSeccionSv"})
public class InicioSeccionSv extends HttpServlet {

    ControladorDeUsuarios controladorDeUsuario = new ControladorDeUsuarios();

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
        
        
        String usuario = request.getParameter("Usuario"); // recibir el usuario 
        String contrasena = request.getParameter("Contrasena"); // recibir la contraseña 

        
        //validar si el usuario se encuentra encuentra registrado  para iniciar seccion para ello se llama al metodo autenticarUsuario
     
        if (controladorDeUsuario.autenticarUsuario(usuario, contrasena)) {
            
            System.out.println("El usuario a iniciado seccion");
            response.sendRedirect("PaginaPrincipal.jsp");// si el usuariio existe se redirecciona a la pagina Principal
        } else {
            
             // En caso de autenticación fallida, se configura un atributo de solicitud para mostrar un mensaje de error.
            request.setAttribute("validarUsuario", true); 
            
            // Se redirecciona de nuevo a la página de inicio (index.jsp) con el mensaje de error.
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