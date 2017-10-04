/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rivera
 */
public class CrudDelegado extends Conexion{
    public List<DelegadoInternacional> mostrar() throws Exception
    {
        List<DelegadoInternacional> listaDelIn=new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from delegadointer";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                DelegadoInternacional di=new DelegadoInternacional();
                di.setIddelegado(res.getInt("iddelegado"));
                di.setNombre(res.getString("nombre"));
                di.setNacionalidad(res.getString("nacionalidad"));
                di.setGenero(res.getString("genero"));
                di.setTelefono(res.getString("telefono"));
                di.setDireccion(res.getString("direccion"));
                listaDelIn.add(di);
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
        return listaDelIn;
    }
    
    public void insertar(DelegadoInternacional di) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into delegadointer values(?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, di.getIddelegado());
            pre.setString(2, di.getNombre());
            pre.setString(3, di.getNacionalidad());
            pre.setString(4, di.getGenero());
            pre.setString(5, di.getTelefono());
            pre.setString(6, di.getDireccion());
            
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
    
    public void modificar(DelegadoInternacional di) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update delegadointer set nombre=?, nacionalidad=?, genero=?, telefono=?, direccion=? where iddelegado=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, di.getNombre());
            pre.setString(2, di.getNacionalidad());
            pre.setString(3, di.getGenero());
            pre.setString(4, di.getTelefono());
            pre.setString(5, di.getDireccion());
            pre.setInt(6, di.getIddelegado());
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
    
    public void eliminar(DelegadoInternacional di) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from delegadointer where iddelegado=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, di.getIddelegado());
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
