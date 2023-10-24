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
        // Obtener el contexto del servlet
        ServletContext context = getServletContext();

        // Leer la lista de tareas desde archivos y establecerla en el controlador
        controlador.setListaTareas(archivos.leerListaTareas(context));

        // Obtener el parámetro "tipo" de la solicitud
        String tipo = request.getParameter("tipo");

        // Imprimir el tipo de solicitud en la consola
        System.out.println("El tipo es " + tipo);

        // Comprobar si el parámetro "tipo" no es nulo
        if (tipo != null) {
            // Iniciar un bloque switch para manejar diferentes tipos de solicitudes
            switch (tipo) {
                case "Eliminar":
                    // Obtener el parámetro "id" que indica la tarea a eliminar
                    String idEliminar = request.getParameter("id");

                    // Intentar eliminar la tarea con el ID especificado
                    if (controlador.eliminarTarea(Integer.parseInt(idEliminar))) {
                        // Imprimir un mensaje de éxito en la consola
                        System.out.println("La tarea con id=" + idEliminar + " ha sido eliminada");

                        // Guardar la lista actualizada de tareas en archivos
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);

                        // Redirigir a la página "Principal.jsp"
                        response.sendRedirect("Principal.jsp");

                        // Establecer una alerta en la sesión para notificar el éxito
                        request.getSession().setAttribute("alertaEliminar", true);
                    } else {
                        // Imprimir un mensaje de error en la consola si no se pudo eliminar
                        System.out.println("No se pudo eliminar la tarea");

                        // Redirigir a la página "Principal.jsp"
                        response.sendRedirect("Principal.jsp");
                    }
                    break;

                case "Editar":
                    // Imprimir un mensaje de depuración
                    System.out.println("Entro en el editar");

                    // Obtener el ID de la tarea a editar, así como otros datos de la solicitud
                    int idEditar = Integer.parseInt(request.getParameter("id").trim());
                    String titulo = request.getParameter("titulo").trim();
                    String descripcion = request.getParameter("descripcion");
                    String fecha = request.getParameter("fecha");

                    // Crear un objeto Tarea con los datos de edición
                    Tarea tarea = new Tarea(idEditar, titulo, descripcion, fecha);

                    // Intentar actualizar la tarea con los nuevos datos
                    if (controlador.actualizarTarea(idEditar, tarea)) {
                        // Guardar la lista actualizada de tareas en archivos
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);

                        // Redirigir a la página "Principal.jsp"
                        response.sendRedirect("Principal.jsp");

                        // Establecer una alerta en la sesión para notificar el éxito
                        request.getSession().setAttribute("alertaEditar", true);
                    } else {
                        // Imprimir un mensaje de error en la consola si no se pudo editar
                        System.out.println("No se pudo editar la tarea");
                    }
                    break;
            }
        } else {
            // Si el parámetro "tipo" es nulo, responder con un error 400 (Solicitud incorrecta)
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

            // Comprobar si el ID de la tarea es válido (mayor que 0)
            if (tarea.getId() > 0) {
                // Obtener los valores de "después" y "antes" de la solicitud
                String despues = request.getParameter("despues");
                String antes = request.getParameter("antes");

                if ((despues != null && !despues.isEmpty()) || (antes != null && !antes.isEmpty())) {
                    // Agregar la tarea después o antes de una tarea específica
                    boolean agregado = false;
                        
                    if (despues != null && !despues.isEmpty()) {
                        // Agregar la tarea después de la tarea especificada
                        agregado = controlador.agregarTareaDespues(tarea, despues);
                        System.out.println("La tarea se ha guardado después de " + despues);
                    } else if (antes != null && !antes.isEmpty()) {
                        // Agregar la tarea antes de la tarea especificada
                        agregado = controlador.agregarTareaAntes(tarea, antes);
                        System.out.println("La tarea se ha guardado antes de " + antes);
                    }

                    if (agregado) {
                        // Guardar la lista de tareas actualizada
                        archivos.guardarListaTareas(controlador.obtenerTodasLasTareas(), context);
                    } else {
                        // Establecer una alerta si no se pudo agregar la tarea
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
                            // Establecer una alerta para notificar el éxito de la operación
                            request.getSession().setAttribute("alertaAgregar", true);
                            System.out.println("La tarea se ha guardado exitosamente");
                        } else {
                            // Imprimir un mensaje de error en la consola si no se pudo guardar la tarea
                            System.out.println("No se pudo guardar la tarea");
                            // Establecer una alerta para notificar el error
                            request.getSession().setAttribute("alertaID", true);
                        }
                    } else {
                        // Agregar la tarea al final de la lista (por defecto) si no se especifica "agregar"
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
                // Redirigir a la página "Principal.jsp" después de completar la operación
                response.sendRedirect("Principal.jsp");
            } else {
                // Establecer una alerta si el ID de la tarea es negativo
                request.getSession().setAttribute("alertaIDnegativo", true);
                // Redirigir a la página "Principal.jsp"
                response.sendRedirect("Principal.jsp");
            }
        } catch (NumberFormatException e) {
            // Manejar la excepción de conversión de número
            System.out.println("ID no válido: " + e.getMessage());
            // Establecer una alerta si el ID no es un número válido
            request.getSession().setAttribute("alertaIDnegativo", true);
            // Redirigir a la página "Principal.jsp"
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
