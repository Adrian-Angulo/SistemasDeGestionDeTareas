/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Usuario;

import java.util.ArrayList;


/**
 * La clase ControladorDeUsuarios gestiona la lista de usuarios. Permite
 * agregar, editar, eliminar y obtener usuarios. Además, se encarga de la
 * autenticación de usuarios. Esta clase hereda de ControladorArchivos para leer
 * y guardar la lista de usuarios en un archivo de texto.
 *
 * Los métodos de esta clase facilitan la administración de usuarios y su
 * persistencia entre sesiones de la aplicación.
 *
 * @author ADRIAN CASTILLO
 */
public class ControladorDeUsuarios extends ControladorArchivos {

    // Lista de usuarios gestionados por el controlador.
    private ArrayList<Usuario> listaUsuarios = new ArrayList<>();

    /**
     * Constructor de la clase ControladorDeUsuarios. Inicializa la lista de
     * usuarios cargando los datos desde el archivo de usuarios.
     */
    public ControladorDeUsuarios() {
        
    }

    /**
     * Agrega un nuevo usuario a la lista de usuarios y guarda la lista
     * actualizada en el archivo.
     *
     * @param usuario El usuario que se va a agregar.
     * @return true si el usuario se agregó con éxito, false si no se pudo
     * agregar.
     */
    public boolean agregarUsuario(Usuario usuario) {
        if (usuario != null) {
            listaUsuarios.add(usuario);
            return true;
        }
        return false;
    }

    /**
     * Edita un usuario existente en la lista de usuarios y guarda la lista
     * actualizada en el archivo.
     *
     * @param id El identificador único del usuario que se va a editar.
     * @param nuevoUsuario El nuevo usuario que reemplazará al existente.
     * @return true si el usuario se editó con éxito, false si no se encontró un
     * usuario con el ID especificado.
     */
    public boolean editarUsuario(int id, Usuario nuevoUsuario) {

        for (Usuario us : listaUsuarios) {
            if (us.getCedula() == id) {
                us.setNombreUsuario(nuevoUsuario.getNombreUsuario());
                us.setContrasena(nuevoUsuario.getContrasena());
                
                return true;
            }

        }
        return false;

    }

    /**
     * Elimina un usuario de la lista de usuarios y guarda la lista actualizada
     * en el archivo.
     *
     * @param id El identificador único del usuario que se va a eliminar.
     * @return true si el usuario se eliminó con éxito, false si no se encontró
     * un usuario con el ID especificado.
     */
    public boolean eliminarUsuario(int id) {
        for (Usuario us : listaUsuarios) {
            if (us.getCedula() == id) {
                listaUsuarios.remove(us);
                
                return true;
            }

        }
        return false;

    }

    /**
     * Obtiene todos los usuarios almacenados en la lista.
     *
     * @return Una lista de todos los usuarios.
     */
    public ArrayList<Usuario> obtenerTodosLosUsuarios() {
        return listaUsuarios;
    }

    public void setListaUsuarios(ArrayList<Usuario> listaUsuarios) {
        this.listaUsuarios = listaUsuarios;
    }

    /**
     * Obtiene un usuario por su identificador único (Cédula).
     *
     * @param id El identificador único del usuario que se busca.
     * @return El usuario encontrado o null si no se encontró ningún usuario con
     * esa cédula.
     */
    public Usuario obtenerUsuarioPorId(int id) {
        for (Usuario usuario : listaUsuarios) {
            if (usuario.getCedula() == id) {
                return usuario;
            }

        }
        return null;
    }

    /**
     * Autentica a un usuario comprobando si el nombre de usuario y la
     * contraseña coinciden.
     *
     * @param nombreUsuario El nombre de usuario del usuario que se va a
     * autenticar.
     * @param contraseña La contraseña del usuario que se va a autenticar.
     * @return true si la autenticación es exitosa, false si las credenciales no
     * coinciden con ningún usuario.
     */
    public boolean autenticarUsuario(String nombreUsuario, String contraseña) {
        for (Usuario usuario : listaUsuarios) {
            if (usuario.getNombreUsuario().equals(nombreUsuario) && usuario.getContrasena().equals(contraseña)) {
                return true;

            }
        }
        return false;
    }

}
