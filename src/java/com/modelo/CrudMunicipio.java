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
public class CrudMunicipio extends Conexion{
    
    public List<Municipio> mostrar() throws Exception
    {
        List<Municipio> lsMun= new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from municipio";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Municipio mun=new Municipio();
                mun.setIdMunicipio(res.getInt("idmuncipio"));
                mun.setNombreMun(res.getString("nombremun"));
                mun.setNoDepto(res.getInt("nodepto"));
                mun.setNumeroCV(res.getInt("numerocv"));
                lsMun.add(mun);
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
        return lsMun;
    }
    
    public void insertar(Municipio mun) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into municipio values(?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, mun.getIdMunicipio());
            pre.setString(2, mun.getNombreMun());
            pre.setInt(3, mun.getNoDepto());
            pre.setInt(4, mun.getNumeroCV());
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
    
    public void modiifcar(Municipio mun) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update municipio set nombremun=?, nodepto=?, numerocv=? where idmuncipio=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, mun.getNombreMun());
            pre.setInt(2, mun.getNoDepto());
            pre.setInt(3, mun.getNumeroCV());
            pre.setInt(4, mun.getIdMunicipio());
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
    
    public void eliminar(Municipio mun) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from municipio where idmuncipio=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, mun.getIdMunicipio());
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
    
    public List<Departamento> lsDep() throws Exception
    {
        List<Departamento> lsDepa=new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from departamento";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            rs=pre.executeQuery();
            while(rs.next())
            {
                Departamento dep=new Departamento();
                dep.setCodDepto(rs.getInt("nodepto"));
                dep.setNombre(rs.getString("nombre"));
                dep.setNumeroDipu(rs.getInt("numdip"));
                lsDepa.add(dep);
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsDepa;
    }
    
}
