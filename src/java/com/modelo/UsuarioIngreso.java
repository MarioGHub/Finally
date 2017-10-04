/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.util.*;
import java.sql.*;
/**
 *
 * @author Rivera
 */
public class UsuarioIngreso extends Conexion{
    
    public int acceder(String Usuario,String Clave) throws Exception
    {
        int nivel=0;
       
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select tipo from usuario where username=? and clave=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, Usuario);
            pre.setString(2, Clave);
            res=pre.executeQuery();
            while(res.next())
            {
                nivel=res.getInt("tipo");
               
            }
            
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return nivel;
      
    }
}
