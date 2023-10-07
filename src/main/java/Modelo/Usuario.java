/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 * La clase Usuario representa a un usuario con un número de cédula, nombre de
 * usuario y contraseña.
 *
 * @author ADRIAN CASTILLO
 */
public class Usuario {

    int cedula;
    String nombreUsuario;
    String contrasena;

    /**
     * Constructor vacío de la clase Usuario.
     */
    public Usuario() {
    }

    /**
     * Constructor de la clase Usuario con parámetros.
     *
     * @param cedula El número de cédula del usuario.
     * @param nombreUsuario El nombre de usuario del usuario.
     * @param contrasena La contraseña del usuario.
     */
    public Usuario(int cedula, String nombreUsuario, String contrasena) {
        this.cedula = cedula;
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
    }

    /**
     * Obtiene el número de cédula del usuario.
     *
     * @return El número de cédula del usuario.
     */
    public int getCedula() {
        return cedula;
    }

    /**
     * Establece el número de cédula del usuario.
     *
     * @param cedula El número de cédula del usuario.
     */
    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    /**
     * Obtiene el nombre de usuario del usuario.
     *
     * @return El nombre de usuario del usuario.
     */
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    /**
     * Establece el nombre de usuario del usuario.
     *
     * @param nombreUsuario El nombre de usuario del usuario.
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    /**
     * Obtiene la contraseña del usuario.
     *
     * @return La contraseña del usuario.
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * Establece la contraseña del usuario.
     *
     * @param contrasena La contraseña del usuario.
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
