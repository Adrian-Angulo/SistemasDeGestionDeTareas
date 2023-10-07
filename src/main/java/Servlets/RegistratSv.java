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
import Modelo.Usuario;
import Controlador.ControladorDeUsuarios;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "RegistratSv", urlPatterns = {"/RegistratSv"})
public class RegistratSv extends HttpServlet {

    Usuario usuario = new Usuario();
    ControladorDeUsuarios usuarioCont = new ControladorDeUsuarios();

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

        String cc = request.getParameter("cedula");
        String nombreUsuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        try {
            Usuario usuario = new Usuario(Integer.parseInt(cc), nombreUsuario, contrasena);
        } catch (Exception e) {
            System.out.println("Error al crear el usuario"+e);
        }

        if (usuarioCont.agregarUsuario(usuario)) {
            System.out.println("El usuario a sido agregado");
            response.sendRedirect("index.jsp");
           
        } else {
            System.out.println("El usuario no ha sido agregado");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
