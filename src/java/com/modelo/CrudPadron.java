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
 * @author VA
 */
public class CrudPadron extends Conexion{
    public List<Padron> mostrar() throws Exception
    {
        List<Padron> listaPadron=new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from votante";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Padron pa=new Padron();
                pa.setDui(res.getInt("dui"));
                pa.setNombre(res.getString("nombre"));
                pa.setDireccion(res.getString("direccion"));
                pa.setNourna(res.getInt("nourna"));
                pa.setGenero(res.getString("genero"));
                pa.setEdad(res.getInt("edad"));
                listaPadron.add(pa);
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
        return listaPadron;
    }
    
    public void insertar(Padron pa) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into votante values(?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, pa.getDui());
            pre.setString(2, pa.getNombre());
            pre.setString(3, pa.getDireccion());
            pre.setInt(4, pa.getNourna());
            pre.setString(5, pa.getGenero());
            pre.setInt(6, pa.getEdad());
            
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
    
    public void modificar(Padron pa) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update votante set nombre=?, direccion=?, nourna=?, genero=?, edad=? where dui=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, pa.getNombre());
            pre.setString(2, pa.getDireccion());
            pre.setInt(3, pa.getNourna());
            pre.setString(4, pa.getGenero());
            pre.setInt(5, pa.getEdad());
            pre.setInt(6, pa.getDui());
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
    
    public void eliminar(Padron pa) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from votante where dui=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, pa.getDui());
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
    
    public List<Urna> listarUrna() throws Exception
    {
        List<Urna> listaU=new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from urna";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Urna ur=new Urna();
                ur.setNoJuntaVotos(res.getInt("nojuntavotos"));
                ur.setNoUrna(res.getInt("nourna"));
                
              
                listaU.add(ur);
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
        return listaU;
    }
}
