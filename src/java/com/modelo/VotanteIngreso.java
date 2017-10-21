
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author VA
 */
public class VotanteIngreso extends Conexion
{
    public int accederV(String Usuario,String Clave,String Respuesta) throws Exception
    {
        int nivel=0;
       
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select tipo from usuario where username=? and clave=? and respuesta=?";
                // Agregar campo respuesta en tabla usuarios 
                // o crear una tabla donde hiran las credenciles del votante
            PreparedStatement pre=this.getCon().prepareStatement(sql);                         
            pre.setString(1, Usuario);
            pre.setString(2, Clave);
            pre.setString(3, Respuesta);
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
