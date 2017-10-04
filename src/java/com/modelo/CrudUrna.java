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
public class CrudUrna extends Conexion{
     public List<Urna> mostrar() throws Exception
    {
        List<Urna> listaUrna=new ArrayList();
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
                ur.setNoUrna(res.getInt("nourna"));
                ur.setNoJuntaVotos(res.getInt("nojuntavotos"));
                listaUrna.add(ur);
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
        return listaUrna;
    }
    
    public void insertar(Urna ur) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into urna values(?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, ur.getNoUrna());
            pre.setInt(2, ur.getNoJuntaVotos());
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
    
    public void modificar(Urna ur) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update urna set nojuntavotos=? where nourna=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setInt(1, ur.getNoJuntaVotos());
            pre.setInt(2, ur.getNoUrna());
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
    
    public void eliminar(Urna ur) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from urna where nourna=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, ur.getNoUrna());
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
    
    public List<JuntaReceptora> lsCentro() throws Exception
    {
        ResultSet res;
        List<JuntaReceptora> lsJR=new ArrayList<>();
        
        try {
            this.conectar();
            String sql="select * from juntavotos";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                JuntaReceptora jv=new JuntaReceptora();
                jv.setNumjuntavotos(res.getInt("numjuntavotos"));
                jv.setNumcentro(res.getInt("numcentro"));
                jv.setIddelegado(res.getInt("iddelegado"));
                jv.setNombre(res.getString("nombre"));
                jv.setCantidadPapeletas(res.getInt("cantidadpapeletas"));
                jv.setCargo(res.getString("cargo"));
                jv.setGenero(res.getString("genero"));
                jv.setDireccion(res.getString("direccion"));
                jv.setTelefono(res.getString("telefono"));
                jv.setFechanac(res.getString("fechanac"));
                lsJR.add(jv);
            }
            
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsJR;
    }
}
