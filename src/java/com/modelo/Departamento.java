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
public class Departamento {
   
    private int codDepto;
    private String nombre;
    private int numeroDipu;

    public Departamento() {
    }

    public Departamento(int codDepto, String nombre, int numeroDipu) {
        this.codDepto = codDepto;
        this.nombre = nombre;
        this.numeroDipu = numeroDipu;
    }

    public int getCodDepto() {
        return codDepto;
    }

    public void setCodDepto(int codDepto) {
        this.codDepto = codDepto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroDipu() {
        return numeroDipu;
    }

    public void setNumeroDipu(int numeroDipu) {
        this.numeroDipu = numeroDipu;
    }
    
    
   
   
}
