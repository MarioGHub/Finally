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
public class CrudDepto extends Conexion{
    
    public List<Departamento> mostrar() throws Exception
    {
        List<Departamento> listaDepto=new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from departamento";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Departamento dep=new Departamento();
                dep.setCodDepto(res.getInt("nodepto"));
                dep.setNombre(res.getString("nombre"));
                dep.setNumeroDipu(res.getInt("numdip"));
                listaDepto.add(dep);
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
        return listaDepto;
    }
    
    public void insertar(Departamento cli) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into departamento values(?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, cli.getCodDepto());
            pre.setString(2, cli.getNombre());
            pre.setInt(3, cli.getNumeroDipu());
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
    
    public void modificar(Departamento cli) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update departamento set nombre=?, numdip=? where nodepto=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, cli.getNombre());
            pre.setInt(2, cli.getNumeroDipu());
            pre.setInt(3, cli.getCodDepto());
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
    
    public void eliminar(Departamento cli) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from departamento where nodepto=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, cli.getCodDepto());
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
