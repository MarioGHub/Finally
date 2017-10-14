/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author VA
 */
public class Padron {
    private int dui;
    private String nombre;
    private String direccion;
    private int nourna;
    private String genero;
    private int edad;

    public Padron() {
    }

    public Padron(int dui, String nombre, String direccion, int nourna, String genero, int edad) {
        this.dui = dui;
        this.nombre = nombre;
        this.direccion = direccion;
        this.nourna = nourna;
        this.genero = genero;
        this.edad = edad;
    }

    public int getDui() {
        return dui;
    }

    public void setDui(int dui) {
        this.dui = dui;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNourna() {
        return nourna;
    }

    public void setNourna(int nourna) {
        this.nourna = nourna;
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
    
    
}
