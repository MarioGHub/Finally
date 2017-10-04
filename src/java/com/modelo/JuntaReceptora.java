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
public class JuntaReceptora {
    private int numjuntavotos;
    private int numcentro;
    private int iddelegado;
    private String nombre;
    private int cantidadPapeletas;
    private String cargo;
    private String genero;
    private String fechanac;
    private String direccion;
    private String telefono;

    public JuntaReceptora() {
    }

    public JuntaReceptora(int numjuntavotos, int numcentro, int iddelegado, String nombre, int cantidadPapeletas, String cargo, String genero, String fechanac, String direccion, String telefono) {
        this.numjuntavotos = numjuntavotos;
        this.numcentro = numcentro;
        this.iddelegado = iddelegado;
        this.nombre = nombre;
        this.cantidadPapeletas = cantidadPapeletas;
        this.cargo = cargo;
        this.genero = genero;
        this.fechanac = fechanac;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getNumjuntavotos() {
        return numjuntavotos;
    }

    public void setNumjuntavotos(int numjuntavotos) {
        this.numjuntavotos = numjuntavotos;
    }

    public int getNumcentro() {
        return numcentro;
    }

    public void setNumcentro(int numcentro) {
        this.numcentro = numcentro;
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

    public int getCantidadPapeletas() {
        return cantidadPapeletas;
    }

    public void setCantidadPapeletas(int cantidadPapeletas) {
        this.cantidadPapeletas = cantidadPapeletas;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechanac() {
        return fechanac;
    }

    public void setFechanac(String fechanac) {
        this.fechanac = fechanac;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    

}
    