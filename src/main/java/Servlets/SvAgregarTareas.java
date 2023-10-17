/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controlador.ControladorDeTareas;
import Controlador.ControladorArchivos;
import Modelo.Tarea;
import java.util.ArrayList;

/**
 *
 * @author ADRIAN CASTILLO
 */
@WebServlet(name = "SvAgregarTareas", urlPatterns = {"/SvAgregarTareas"})
public class SvAgregarTareas extends HttpServlet {

    ControladorDeTareas controlador = new ControladorDeTareas();
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
        ServletContext context = getServletContext();

        controlador.setListaTareas(archivos.leerListaTareas(context));
        String id = request.getParameter("id");
        String tipo = request.getParameter("tipo");
        System.out.println("el id es" + id);

        if (id != null && tipo != null) {
            switch (tipo) {
                case "Eliminar":
                    if (controlador.eliminarTarea(Integer.parseInt(id))) {
                        System.out.println("La tarea con id=" + id + " ha sido eliminada");
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                        response.sendRedirect("Principal.jsp");
                    } else {
                        System.out.println("no se pudo eliminar");
                        response.sendRedirect("Principal.jsp");
                    }

                    break;

                case "Editar":
                    break;

            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros faltantes o no válidos.");
        }
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
        controlador.setListaTareas(archivos.leerListaTareas(context));
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        Tarea tarea = new Tarea(id, titulo, descripcion, fecha);

        if (tarea.getId()>0) {

            if (controlador.agregarTarea(tarea)) {
                archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                System.out.println("la tarea se ha guardado exitosamente");
                response.sendRedirect("Principal.jsp");
            } else {
                System.out.println("no se pudo guardar la tarea");
                request.getSession().setAttribute("alertaID", true); //enviar un parametro para mostrar la alerta 
                response.sendRedirect("Principal.jsp");
            }

        } else {
            request.getSession().setAttribute("alertaIDnegativo", true); //enviar un parametro para mostrar la alerta 
            response.sendRedirect("Principal.jsp");
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
