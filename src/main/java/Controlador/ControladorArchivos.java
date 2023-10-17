
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Tarea;
import Modelo.Usuario;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 * La clase ControladorArchivos proporciona métodos para leer y guardar listas
 * de tareas y usuarios desde y hacia archivos de texto. Los archivos de texto
 * se utilizan para persistir datos entre sesiones de la aplicación. Además de
 * leer y guardar tareas, también puede leer y guardar listas de usuarios. Estos
 * métodos facilitan la gestión de datos de la aplicación.
 *
 * Los archivos de tareas se almacenan en el archivo "tareas.txt", mientras que
 * los archivos de usuarios se almacenan en el archivo "usuarios.txt". Cada
 * línea en estos archivos representa un elemento en la lista con valores
 * separados por comas.
 *
 * @author ADRIAN CASTILLO
 */
public class ControladorArchivos {

    /**
     * Guarda la lista de tareas en un archivo de texto.
     *
     * @param tareas La lista de tareas que se va a guardar en el archivo.
     */
    public void guardarListaTareas(ArrayList<Tarea> tareas, ServletContext context) {
        /**
         * Establecemos la ruta
         */
        String ruta = "/Archivos/tareas.txt";// Nombramos la carpeta ya creada y el tipo de archivo que queremos crear -Datos conocidos

        String rutaa = context.getRealPath(ruta);
        try (FileWriter fileWriter = new FileWriter(rutaa); BufferedWriter bufferedWriter = new BufferedWriter(fileWriter)) {

            for (Tarea tarea : tareas) {
                bufferedWriter.write(tarea.getId() + "," + tarea.getTitulo() + ","
                        + tarea.getDescripcion() + "," + tarea.getFechaDeVencimiento());
                bufferedWriter.newLine();
            }

            System.out.println("Tareas escritas en el archivo exitosamente.");

        } catch (IOException e) {
            System.out.println("No se pudo escrbir en el archivo");
        }
    }

    /**
     * Lee la lista de tareas desde un archivo de texto y la devuelve como una
     * lista de objetos Tarea.
     *
     * @param context
     * @return Una lista de tareas leída desde el archivo de tareas.
     */
    public ArrayList<Tarea> leerListaTareas(ServletContext context) {
        String ruta = "/Archivos/tareas.txt";// Nombramos la carpeta ya creada y el tipo de archivo que queremos crear -Datos conocidos

        String rutaa = context.getRealPath(ruta);
        ArrayList<Tarea> tareas = new ArrayList<>();

        try (FileReader fileReader = new FileReader(rutaa); BufferedReader bufferedReader = new BufferedReader(fileReader)) {

            String linea;
            while ((linea = bufferedReader.readLine()) != null) {
                String[] partes = linea.split(",");
                if (partes.length == 4) {
                    int id = Integer.parseInt(partes[0]);
                    String titulo = partes[1];
                    String descripcion = partes[2];
                    String fechaDeVencimiento = partes[3];
                    Tarea tarea = new Tarea(id, titulo, descripcion, fechaDeVencimiento);
//                    tarea.setId(id);
                    tareas.add(tarea);

                }
            }

        } catch (IOException e) {
            System.out.println("No se pudo leer el archivo");
        }

        return tareas;
    }

    /**
     * Guarda la lista de usuarios en un archivo de texto.
     *
     * @param listaUsuarios La lista de usuarios que se va a guardar en el
     * archivo.
     */
    public  void guardarListaUsuarios(ArrayList<Usuario> usuario, ServletContext context) {
        String ruta = "/Archivos/usuarios.txt";// Nombramos la carpeta ya creada y el tipo de archivo que queremos crear -Datos conocidos

        String rutaa = context.getRealPath(ruta);
        try (BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(rutaa))) {

            for (Usuario usu : usuario) {
                bufferedWriter.write(usu.getCedula() + "," + usu.getNombreUsuario() + ","
                        + usu.getContrasena());
                bufferedWriter.newLine();
            }

            System.out.println("usuarios escritos en el archivo exitosamente.");

        } catch (IOException e) {
            System.out.println("No se pudo escrbir en el archivo");
        }
    }

    /**
     * Lee la lista de usuarios desde un archivo de texto y la devuelve como una
     * lista de objetos Usuario.
     *
     * @return Una lista de usuarios leída desde el archivo de usuarios.
     */
    public ArrayList<Usuario> leerListaUsuarios(ServletContext context) {
        String ruta = "/Archivos/usuarios.txt";// Nombramos la carpeta ya creada y el tipo de archivo que queremos crear -Datos conocidos

        String rutaa = context.getRealPath(ruta);
        ArrayList<Usuario> listausuario = new ArrayList<>();

        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(rutaa))) {

            String linea;
            while ((linea = bufferedReader.readLine()) != null) {
                String[] partes = linea.split(",");
                if (partes.length == 3) {
                    int cc = Integer.parseInt(partes[0]);
                    String nombreUsuairo = partes[1];
                    String contrasena = partes[2];

                    Usuario usuario = new Usuario(cc, nombreUsuairo, contrasena);

                    listausuario.add(usuario);

                }
            }

        } catch (IOException e) {
            System.out.println("No se pudo leer el archivo");
        }

        return listausuario;
    }

}
