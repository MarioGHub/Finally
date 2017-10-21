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
public class Candidato {
    private int idCandidato;
    private int idPartido;
    private String nombre;
    private String genero;
    private int edad;
    private String telefono;
    private String direccion;

    public Candidato() {
    }

    public Candidato(int idCandidato, int idPartido, String nombre, String genero, int edad, String telefono, String direccion) {
        this.idCandidato = idCandidato;
        this.idPartido = idPartido;
        this.nombre = nombre;
        this.genero = genero;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }

    public int getIdPartido() {
        return idPartido;
    }

    public void setIdPartido(int idPartido) {
        this.idPartido = idPartido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
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
