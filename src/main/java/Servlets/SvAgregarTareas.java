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

        String tipo = request.getParameter("tipo");

        System.out.println("el tipo es " + tipo);

        if (tipo != null) {
            switch (tipo) {
                case "Eliminar":
                    String idEliminar = request.getParameter("id");
                    if (controlador.eliminarTarea(Integer.parseInt(idEliminar))) {
                        System.out.println("La tarea con id=" + idEliminar + " ha sido eliminada");
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                        response.sendRedirect("Principal.jsp");
                        request.getSession().setAttribute("alertaEliminar", true);
                    } else {
                        System.out.println("no se pudo eliminar");
                        response.sendRedirect("Principal.jsp");
                    }

                    break;

                case "Editar":
                    System.out.println("Entro en el editar");
                    int idEditar = Integer.parseInt(request.getParameter("id").trim());
                    String titulo = request.getParameter("titulo").trim();
                    String descripcion = request.getParameter("descripcion");
                    String fecha = request.getParameter("fecha");
                    Tarea tarea = new Tarea(idEditar, titulo, descripcion, fecha);
                    
                    if(controlador.actualizarTarea(idEditar, tarea)){
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                        response.sendRedirect("Principal.jsp");
                        request.getSession().setAttribute("alertaEditar", true);
                        
                    }else{
                        System.out.println("no se puedo editar la tara");
                    }

                    break;

            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parámetros faltantes o no válidos.");
        }
    }

 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ServletContext context = getServletContext();

    try {
        // Leer la lista de tareas desde el contexto de la aplicación
        controlador.setListaTareas(archivos.leerListaTareas(context));

        // Obtener los parámetros de la solicitud
        int id = Integer.parseInt(request.getParameter("id").trim());
        String titulo = request.getParameter("titulo").trim();
        String descripcion = request.getParameter("descripcion");
        String fecha = request.getParameter("fecha");
        Tarea tarea = new Tarea(id, titulo, descripcion, fecha);

        if (tarea.getId() > 0) {
            // Obtener los valores de "despues" y "antes" de la solicitud
            String despues = request.getParameter("despues");
            String antes = request.getParameter("antes");

            if ((despues != null && !despues.isEmpty()) || (antes != null && !antes.isEmpty())) {
                // Agregar la tarea después o antes de una tarea específica
                boolean agregado = false;

                if (despues != null && !despues.isEmpty()) {
                    agregado = controlador.agregarTareaDespues(tarea, despues);
                    System.out.println("La tarea se ha guardado después de " + despues);
                } else if (antes != null && !antes.isEmpty()) {
                    agregado = controlador.agregarTareaAntes(tarea, antes);
                    System.out.println("La tarea se ha guardado antes de " + antes);
                }

                if (agregado) {
                    // Guardar la lista de tareas actualizada
                    archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                } else {
                    request.getSession().setAttribute("alertaDespues", true);
                }
            } else {
                // Obtener el valor de "agregar" de la solicitud
                String agregar = request.getParameter("agregar");

                if (agregar != null && !agregar.isEmpty()) {
                    // Agregar la tarea al principio o al final de la lista
                    if (controlador.agregarTarea(tarea, agregar)) {
                        // Guardar la lista de tareas actualizada
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                        System.out.println("La tarea se ha guardado exitosamente");
                    } else {
                        System.out.println("No se pudo guardar la tarea");
                        request.getSession().setAttribute("alertaID", true);
                    }
                } else {
                     if (controlador.agregarTarea(tarea, agregar)) {
                        // Guardar la lista de tareas actualizada
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                        System.out.println("La tarea se ha guardado exitosamente");
                    } else {
                        System.out.println("No se pudo guardar la tarea");
                        request.getSession().setAttribute("alertaID", true);
                    }
                }
            }
            response.sendRedirect("Principal.jsp");
        } else {
            request.getSession().setAttribute("alertaIDnegativo", true);
            response.sendRedirect("Principal.jsp");
        }
    } catch (NumberFormatException e) {
        // Manejo de la excepción de conversión de número
        System.out.println("ID no válido: " + e.getMessage());
        request.getSession().setAttribute("alertaIDnegativo", true);
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
