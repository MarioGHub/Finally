/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;
import java.util.*;
import java.sql.*;

/**
 * Nombre de Clase: Conexion.
 * Fecha: 23/09/2017.
 * Version: 1.0;
 * Copyright: ITCA-FEPADE.
 * @author Rivera
 */
public class Conexion {
    private Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public void conectar() throws Exception
    {
        try
        {
            Class.forName("org.postgresql.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/sistemadevoto?user=postgres&password=root");
        }
        catch (Exception e)
        {
            throw e;
        }
    }
    
    public void desconectar() throws Exception
    {
        try
        {
            if(con!=null)
            {
                if(con.isClosed()==false)
                {
                    con.isClosed();
                }
            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }
}
