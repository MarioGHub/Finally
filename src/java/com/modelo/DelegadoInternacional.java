/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author Rivera
 */
public class DelegadoInternacional {
    private int iddelegado;
    private String nombre;
    private String nacionalidad;
    private String genero;
    private String telefono;
    private String direccion;

    public DelegadoInternacional() {
    }

    public DelegadoInternacional(int iddelegado, String nombre, String nacionalidad, String genero, String telefono, String direccion) {
        this.iddelegado = iddelegado;
        this.nombre = nombre;
        this.nacionalidad = nacionalidad;
        this.genero = genero;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public int getIddelegado() {
        return iddelegado;
    }

    public void setIddelegado(int iddelegado) {
        this.iddelegado = iddelegado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
   
}
