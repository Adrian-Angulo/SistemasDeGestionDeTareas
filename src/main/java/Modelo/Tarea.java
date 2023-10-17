/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


/**
 * La clase Tarea representa una tarea con un identificador único, título, descripción y fecha de vencimiento.
 * 
 * @author ADRIAN CASTILLO
 */
public class Tarea {
    int id;
    String titulo;
    String descripcion;
    String fechaDeVencimiento;

    /**
     * Constructor vacío de la clase Tarea.
     */
    public Tarea() {
    }
 /**
     * Constructor de la clase Tarea con parámetros.
     *
     * @param titulo El título de la tarea.
     * @param descripcion La descripción de la tarea.
     * @param fechaDeVencimiento La fecha de vencimiento de la tarea.
     */

    public Tarea(int id, String titulo, String descripcion, String fechaDeVencimiento) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaDeVencimiento = fechaDeVencimiento;
    }
 /**
     * Obtiene el identificador único de la tarea.
     *
     * @return El identificador único de la tarea.
     */
    public int getId() {
        return id;
    }
 /**
     * Establece el identificador único de la tarea.
     *
     * @param id El identificador único de la tarea.
     */
    public void setId(int id) {
        this.id = id;
    }
   /**
     * Obtiene el título de la tarea.
     *
     * @return El título de la tarea.
     */
    public String getTitulo() {
        return titulo;
    }
    /**
     * Establece el título de la tarea.
     *
     * @param titulo El título de la tarea.
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * Obtiene la descripción de la tarea.
     *
     * @return La descripción de la tarea.
     */
    public String getDescripcion() {
        return descripcion;
    }
  /**
     * Establece la descripción de la tarea.
     *
     * @param descripcion La descripción de la tarea.
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    /**
     * Obtiene la fecha de vencimiento de la tarea.
     *
     * @return La fecha de vencimiento de la tarea.
     */
    public String getFechaDeVencimiento() {
        return fechaDeVencimiento;
    }
   /**
     * Establece la fecha de vencimiento de la tarea.
     *
     * @param fechaDeVencimiento La fecha de vencimiento de la tarea.
     */
    public void setFechaDeVencimiento(String fechaDeVencimiento) {
        this.fechaDeVencimiento = fechaDeVencimiento;
    }


    
}
