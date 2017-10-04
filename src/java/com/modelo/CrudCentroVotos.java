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
public class CrudCentroVotos extends Conexion{
    
     public List<CentroVotos> mostrar() throws Exception
    {
        List<CentroVotos> lsCenVot= new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from centrovotos";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                CentroVotos cv=new CentroVotos();
                cv.setNumCentro(res.getInt("numcentro"));
                cv.setIdMunicipio(res.getInt("idmunicipio"));
                cv.setNumeroJRV(res.getInt("numerojrv"));
                cv.setNombre(res.getString("nombre"));
                cv.setEncargado(res.getString("encargado"));
                cv.setDireccion(res.getString("direccion"));
                lsCenVot.add(cv);
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
        return lsCenVot;
    }
    
    public void insertar(CentroVotos cv) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into centrovotos values(?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, cv.getNumCentro());
            pre.setInt(2, cv.getIdMunicipio());
            pre.setInt(3, cv.getNumeroJRV());
            pre.setString(4, cv.getNombre());
            pre.setString(5, cv.getEncargado());
            pre.setString(6, cv.getDireccion());
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
    
    public void modiifcar(CentroVotos cv) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update centrovotos set idmunicipio=?, numerojrv=?, nombre=?, encargado=?, direccion=? where numcentro=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setInt(1, cv.getIdMunicipio());
            pre.setInt(2, cv.getNumeroJRV());
            pre.setString(3, cv.getNombre());
            pre.setString(4, cv.getEncargado());
            pre.setString(5, cv.getDireccion());
            pre.setInt(6, cv.getNumCentro());
            
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
    
    public void eliminar(CentroVotos cv) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from centrovotos where numcentro=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, cv.getNumCentro());
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
    
    public List<Municipio> lsMun() throws Exception
    {
        List<Municipio> lsMun=new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from municipio";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            rs=pre.executeQuery();
            while(rs.next())
            {
                Municipio mun=new Municipio();
                mun.setIdMunicipio(rs.getInt("idmuncipio"));
                mun.setNombreMun(rs.getString("nombremun"));
                mun.setNoDepto(rs.getInt("nodepto"));
                mun.setNumeroCV(rs.getInt("numerocv"));
                lsMun.add(mun);
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsMun;
    }
}
