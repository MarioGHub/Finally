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
public class Municipio {
    private int idMunicipio;
    private String nombreMun;
    private int noDepto;
    private int numeroCV;

    public Municipio() {
    }

    public Municipio(int idMunicipio, String nombreMun, int noDepto, int numeroCV) {
        this.idMunicipio = idMunicipio;
        this.nombreMun = nombreMun;
        this.noDepto = noDepto;
        this.numeroCV = numeroCV;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public String getNombreMun() {
        return nombreMun;
    }

    public void setNombreMun(String nombreMun) {
        this.nombreMun = nombreMun;
    }

    public int getNoDepto() {
        return noDepto;
    }

    public void setNoDepto(int noDepto) {
        this.noDepto = noDepto;
    }

    public int getNumeroCV() {
        return numeroCV;
    }

    public void setNumeroCV(int numeroCV) {
        this.numeroCV = numeroCV;
    }
    
    
}
