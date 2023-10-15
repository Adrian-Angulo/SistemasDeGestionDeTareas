/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Tarea;

import java.util.ArrayList;


/**
 * ControladorDeTareas es una clase que gestiona las tareas. Esta clase permite
 * agregar, actualizar, eliminar y obtener tareas. Además, asigna
 * automáticamente identificadores únicos a las tareas.
 *
 * @author ADRIAN CASTILLO
 */
public class ControladorDeTareas extends ControladorArchivos{

    // Lista de tareas gestionadas por el controlador.
    private ArrayList<Tarea> listaTareas = new ArrayList<>();

    // Identificador único para la próxima tarea.
    private int nextId;

    public ControladorDeTareas() {
        
        nextId = obtenerSiguienteId();
    }

    public void setListaTareas(ArrayList<Tarea> listaTareas) {
        this.listaTareas = listaTareas;
    }

    /**
     * Obtiene todas las tareas almacenadas en el controlador.
     *
     * @return Una lista de todas las tareas.
     */
    public ArrayList<Tarea> obtenerTodasLasTareas() {
        return listaTareas;
    }

    /**
     * Obtiene el siguiente identificador único disponible para asignar a una
     * nueva tarea.
     *
     * @return El siguiente identificador único disponible.
     */
    private int obtenerSiguienteId() {
        // Inicializar la variable que almacenará el máximo identificador a 0.
        int maxId = 0;
        // Iterar a través de todas las tareas en la lista.
        for (Tarea tarea : listaTareas) {
            // Comprobar si el identificador de la tarea actual es mayor que el máximo actual.
            if (tarea.getId() > maxId) {
                // Si es así, actualizar el valor de maxId con el nuevo máximo identificador.
                maxId = tarea.getId();
            }
        }
        // Incrementar el máximo identificador encontrado en 1 para obtener el siguiente ID disponible.
        return maxId + 1;
    }

    /**
     * Obtiene una tarea por su identificador único.
     *
     * @param titulo El Titulo de la tarea que se busca.
     * @return La tarea encontrada o null si no se encuentra ninguna tarea con
     * ese Titulo.
     */
    public Tarea obtenerTareaPorTitulo(String titulo) {
        //recorrer lista de tareas 
        for (Tarea tarea : listaTareas) {
            //si existe una una tarea con igual a contenido de la variable titulo
            if (tarea.getTitulo().equals(titulo)) {
                return tarea; // retornar la tarea 
            }
        }
        return null;
    }

    /**
     * Agrega una nueva tarea al controlador. Asigna un identificador único a la
     * tarea.
     *
     * @param tarea La tarea que se va a agregar.
     * @return true si la tarea se agregó con éxito, false si no se pudo
     * agregar.
     */
    public boolean agregarTarea(Tarea tarea) {
        // Verificar si la tarea no es nula
        if (tarea != null) {
            // Obtener el siguiente ID disponible
            int id = obtenerSiguienteId();

            // Obtener el siguiente ID disponible
            if (id > 0) {
                tarea.setId(id); // Asignar el ID a la tarea

                listaTareas.add(tarea);  // Agregar la tarea a la lista de tareas
                
                return true; // Devolver true para indicar que la tarea se agregó con éxito

            }
        }
        return false; // Devolver false si la tarea es nula o no se pudo agregar

    }

    /**
     * Actualiza una tarea existente en el controlador.
     *
     * @param id El identificador único de la tarea que se va a actualizar.
     * @param nuevaTarea La nueva información de la tarea que reemplazará a la
     * existente.
     * @return true si la tarea se actualizó con éxito, false si no se pudo
     * encontrar la tarea con el ID especificado.
     */
    public boolean actualizarTarea(int id, Tarea nuevaTarea) {
        // Recorrer la lista de tareas
        for (Tarea tarea : listaTareas) {
            // Verificar si la tarea actual tiene el mismo ID que el especificado
            if (tarea.getId() == id) {
                // Actualizar los atributos de la tarea existente con la nueva información
                tarea.setTitulo(nuevaTarea.getTitulo());
                tarea.setDescripcion(nuevaTarea.getDescripcion());
                tarea.setFechaDeVencimiento(nuevaTarea.getFechaDeVencimiento());

                // Guardar la lista actualizada en el archivo
                

                // Devolver true para indicar que la tarea se actualizó con éxito
                return true;
            }
        }

        // Devolver false si no se encontró una tarea con el ID especificado
        return false;
    }

    /**
     * Elimina una tarea por su identificador único.
     *
     * @param id El identificador de la tarea que se va a eliminar.
     * @return true si la tarea se eliminó con éxito, false si no se encontró
     * una tarea con el ID especificado.
     */
    public boolean eliminarTarea(int id) {
        // Recorrer la lista de tareas
        for (Tarea t : listaTareas) {
            // Verificar si la tarea actual tiene el mismo ID que el especificado
            if (t.getId() == id) {
                // Eliminar la tarea de la lista
                listaTareas.remove(t);
                // Devolver true para indicar que la tarea se eliminó con éxito
                return true;
            }
        }

        // Devolver false si no se encontró una tarea con el ID especificado
        return false;
    }

    
}
