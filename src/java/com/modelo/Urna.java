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
public class Urna {
    private int noUrna;
    private int noJuntaVotos;

    public Urna() {
    }

    public Urna(int noUrna, int noJuntaVotos) {
        this.noUrna = noUrna;
        this.noJuntaVotos = noJuntaVotos;
    }

    public int getNoUrna() {
        return noUrna;
    }

    public void setNoUrna(int noUrna) {
        this.noUrna = noUrna;
    }

    public int getNoJuntaVotos() {
        return noJuntaVotos;
    }

    public void setNoJuntaVotos(int noJuntaVotos) {
        this.noJuntaVotos = noJuntaVotos;
    }
    
    
}
