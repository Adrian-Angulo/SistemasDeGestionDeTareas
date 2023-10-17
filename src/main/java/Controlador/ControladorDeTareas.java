/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Tarea;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * ControladorDeTareas es una clase que gestiona las tareas. Esta clase permite
 * agregar, actualizar, eliminar y obtener tareas. Además, asigna
 * automáticamente identificadores únicos a las tareas.
 *
 * @author ADRIAN CASTILLO
 */
public class ControladorDeTareas extends ControladorArchivos {

    // Lista de tareas gestionadas por el controlador.
    private ArrayList<Tarea> listaTareas = new ArrayList<>();

    // Identificador único para la próxima tarea.
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
            // Verificar si la tarea ya existe en la lista por su ID
            for (Tarea t : listaTareas) {
                if (t.getId() == tarea.getId()) {
                    // La tarea ya existe en la lista, no se puede agregar otra con el mismo ID
                    return false;
                }
            }

            // Si llegamos aquí, significa que la tarea no existe en la lista
            // Agregar la tarea a la lista de tareas
            listaTareas.add(tarea);
            return true; // Devolver true para indicar que la tarea se agregó con éxito
        }
        return false; // Devolver false si la tarea es nula
    }
     /**
             * Actualiza una tarea existente en el controlador.
             *
             * @param id El identificador único de la tarea que se va a
             * actualizar.
             * @param nuevaTarea La nueva información de la tarea que
             * reemplazará a la existente.
             * @return true si la tarea se actualizó con éxito, false si no se
             * pudo encontrar la tarea con el ID especificado.
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
        Iterator<Tarea> iterator = listaTareas.iterator();
        while (iterator.hasNext()) {
            Tarea t = iterator.next();
            if (t.getId() == id) {
                iterator.remove(); // Eliminar la tarea usando el iterador
                return true;
            } else {
                System.out.println("no se encontro el id");
            }
        }
        return false;
    }

}
