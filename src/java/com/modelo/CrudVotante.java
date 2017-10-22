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
public class CrudVotante extends Conexion{
    
     public List<Votante> mostrar() throws Exception
    {
        List<Votante> lsVot= new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from votante";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Votante vot=new Votante();
                vot.setDui(res.getString("dui"));
                vot.setNombre(res.getString("nombre"));
                vot.setDireccion(res.getString("direccion"));
                vot.setGenero(res.getString("genero"));
                vot.setAnionacimiento(res.getInt("anionacimiento"));
                vot.setApellido(res.getString("apellido"));
                vot.setDepartamento(res.getInt("departamento"));
                vot.setMunicipio(res.getInt("municipio"));
                vot.setCentro(res.getInt("centrovotos"));
                vot.setPregunta(res.getString("pregunta"));
                vot.setPass(res.getString("pass"));
                lsVot.add(vot);
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
        return lsVot;
    }
    
    public void insertar(Votante vot) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into votante values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, vot.getDui());
            pre.setString(2, vot.getNombre());
            pre.setString(3, vot.getDireccion());
            pre.setString(4, vot.getGenero());
            pre.setInt(5, vot.getAnionacimiento());
            pre.setString(6, vot.getApellido());
            pre.setInt(7, vot.getDepartamento());
            pre.setInt(8, vot.getMunicipio());
            pre.setInt(9, vot.getCentro());
            pre.setString(10, vot.getPregunta());
            pre.setString(11, vot.getPass());
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
    
    public void modificar(Votante vot) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update votante set nombre=?, direccion=?, genero=?, anionacimiento=?, apellido=?, departamento=?, municipio=?, centrovotos=?, pregunta=?, pass=? where dui=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setString(1, vot.getNombre());
            pre.setString(2, vot.getDireccion());
            pre.setString(3, vot.getGenero());
            pre.setInt(4, vot.getAnionacimiento());
            pre.setString(5, vot.getApellido());
            pre.setInt(6, vot.getDepartamento());
            pre.setInt(7, vot.getMunicipio());
            pre.setInt(8, vot.getCentro());
            pre.setString(9, vot.getPregunta());
            pre.setString(10, vot.getPass());
            pre.setString(11, vot.getDui());
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
    
    public void eliminar(Votante vot) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from votante where dui=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, vot.getDui());
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
                mun.setNoDepto(rs.getInt("nodepto"));
                mun.setNombreMun(rs.getString("nombremun"));
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
    
    public List<CentroVotos> lsCentro() throws Exception
    {
        List<CentroVotos> lsCen=new ArrayList<>();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from centrovotos";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            rs=pre.executeQuery();
            while(rs.next())
            {
                CentroVotos cv=new CentroVotos();
                cv.setNumCentro(rs.getInt("numcentro"));
                cv.setIdMunicipio(rs.getInt("idmunicipio"));
                cv.setNumeroJRV(rs.getInt("numerojrv"));
                cv.setNombre(rs.getString("nombre"));
                cv.setEncargado(rs.getString("encargado"));
                cv.setDireccion(rs.getString("direccion"));
                lsCen.add(cv);
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsCen;
    }
}
