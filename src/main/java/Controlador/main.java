/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import Controlador.ControladorDeUsuarios;
import Modelo.Tarea;
import java.util.ArrayList;

/**
 *
 * @author ADRIAN CASTILLO
 */
public class main {

    public static void main(String[] args) {
        
        ControladorDeTareas tareasCont = new ControladorDeTareas();
        Tarea tarea = new Tarea( 0,"cocinar", "lavar los patos de la cocina", "7/10/2023");
        
        if(tareasCont.agregarTarea(tarea)){
            System.out.println("Se ha agregado una tarea");
        }
        else{
            System.out.println("no se pudo agregar la tarea ");
        }

        
        
        
    }
}
