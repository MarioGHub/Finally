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
public class CentroVotos {
    private int numCentro;
    private int idMunicipio;
    private int numeroJRV;
    private String nombre;
    private String encargado;
    private String direccion;

    public CentroVotos() {
    }

    public CentroVotos(int numCentro, int idMunicipio, int numeroJRV, String nombre, String encargado, String direccion) {
        this.numCentro = numCentro;
        this.idMunicipio = idMunicipio;
        this.numeroJRV = numeroJRV;
        this.nombre = nombre;
        this.encargado = encargado;
        this.direccion = direccion;
    }

    public int getNumCentro() {
        return numCentro;
    }

    public void setNumCentro(int numCentro) {
        this.numCentro = numCentro;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public int getNumeroJRV() {
        return numeroJRV;
    }

    public void setNumeroJRV(int numeroJRV) {
        this.numeroJRV = numeroJRV;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEncargado() {
        return encargado;
    }

    public void setEncargado(String encargado) {
        this.encargado = encargado;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
}
