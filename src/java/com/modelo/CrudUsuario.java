/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
/**
 *
 * @author Rivera
 */
public class CrudUsuario extends Conexion{
    
    public List<Usuario> mostrarUsuario() throws Exception
    {
        List<Usuario> lsUser= new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from Usuario";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Usuario usu=new Usuario();
                usu.setId(res.getInt("codusuario"));
                usu.setUserName(res.getString("username"));
                usu.setClave(res.getString("clave"));
                usu.setTipo(res.getInt("tipo"));
                lsUser.add(usu);
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
        return lsUser;
    }
    
    public void insertar(Usuario usu) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into Usuario values(?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, usu.getId());
            pre.setString(2, usu.getUserName());
            pre.setString(3, usu.getClave());
            pre.setInt(4, usu.getTipo());
            pre.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modiifcar(Usuario usu) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update usuario set username=?, clave=?, tipo=? where codusuario=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, usu.getUserName());
            pre.setString(2, usu.getClave());
            pre.setInt(3, usu.getTipo());
            pre.setInt(4, usu.getId());
            pre.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminar(Usuario usu) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from Usuario where codusuario=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, usu.getId());
            pre.executeUpdate();
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    
    
}
