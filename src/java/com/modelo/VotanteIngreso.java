/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Rivera
 */
public class VotanteIngreso extends Conexion{
    public int acceder(String Dui,String Pass, String Pregunta) throws Exception
    {
        int depto=0;
       
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select departamento from votante where dui=? and pass=? and pregunta=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, Dui);
            pre.setString(2, Pass);
            pre.setString(3, Pregunta);
           
            res=pre.executeQuery();
            while(res.next())
            {
                depto=res.getInt("departamento");
               
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
        return depto;
      
    }
}
