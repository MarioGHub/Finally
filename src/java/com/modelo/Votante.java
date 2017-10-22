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
public class Votante {
    private String dui;
    private String nombre;
    private String direccion;
    private String genero;
    private int anionacimiento;
    private String apellido;
    private int departamento;
    private int municipio;
    private int centro;
    private String pregunta;
    private String pass;

    public Votante() {
    }

    public Votante(String dui, String nombre, String direccion, String genero, int anionacimiento, String apellido, int departamento, int municipio, int centro, String pregunta, String pass) {
        this.dui = dui;
        this.nombre = nombre;
        this.direccion = direccion;
        this.genero = genero;
        this.anionacimiento = anionacimiento;
        this.apellido = apellido;
        this.departamento = departamento;
        this.municipio = municipio;
        this.centro = centro;
        this.pregunta = pregunta;
        this.pass = pass;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
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

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getAnionacimiento() {
        return anionacimiento;
    }

    public void setAnionacimiento(int anionacimiento) {
        this.anionacimiento = anionacimiento;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDepartamento() {
        return departamento;
    }

    public void setDepartamento(int departamento) {
        this.departamento = departamento;
    }

    public int getMunicipio() {
        return municipio;
    }

    public void setMunicipio(int municipio) {
        this.municipio = municipio;
    }

    public int getCentro() {
        return centro;
    }

    public void setCentro(int centro) {
        this.centro = centro;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    
}