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
public class CrudJunta extends Conexion{
    
    public List<JuntaReceptora> mostrar() throws Exception
    {
        List<JuntaReceptora> listaJunRec=new ArrayList();
        ResultSet res;
        try
        {
            this.conectar();
            String sql="select * from juntavotos";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                JuntaReceptora jr=new JuntaReceptora();
                jr.setNumjuntavotos(res.getInt("numjuntavotos"));
                jr.setNumcentro(res.getInt("numcentro"));
                jr.setIddelegado(res.getInt("iddelegado"));
                jr.setNombre(res.getString("nombre"));
                jr.setCantidadPapeletas(res.getInt("cantidadpapeletas"));
                jr.setCargo(res.getString("cargo"));
                jr.setGenero(res.getString("genero"));
                jr.setFechanac(res.getString("fechanac"));
                jr.setDireccion(res.getString("direccion"));
                jr.setTelefono(res.getString("telefono"));
                listaJunRec.add(jr);
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
        return listaJunRec;
    }
    
    public void insertar(JuntaReceptora jr) throws Exception
    {
        try
        {
            this.conectar();
            String sql="insert into juntavotos values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, jr.getNumjuntavotos());
            pre.setInt(2, jr.getNumcentro());
            pre.setInt(3, jr.getIddelegado());
            pre.setString(4, jr.getNombre());
            pre.setInt(5, jr.getCantidadPapeletas());
            pre.setString(6, jr.getCargo());
            pre.setString(7, jr.getGenero());
            pre.setString(8, jr.getFechanac());
            pre.setString(9, jr.getDireccion());
            pre.setString(10, jr.getTelefono());
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
    
    public void modificar(JuntaReceptora jr) throws Exception
    {
        try
        {
            this.conectar();
            String sql="update juntavotos set numcentro=?, iddelegado=?, nombre=?, cantidadpapeletas=?, cargo=?, genero=?, fechanac=?, direccion=?, telefono=? where numjuntavotos=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setInt(1, jr.getNumcentro());
            pre.setInt(2, jr.getIddelegado());
            pre.setString(3, jr.getNombre());
            pre.setInt(4, jr.getCantidadPapeletas());
            pre.setString(5, jr.getCargo());
            pre.setString(6, jr.getGenero());
            pre.setString(7, jr.getFechanac());
            pre.setString(8, jr.getDireccion());
            pre.setString(9, jr.getTelefono());
            pre.setInt(10, jr.getNumjuntavotos());
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
    
    public void eliminar(JuntaReceptora jr) throws Exception
    {
        try
        {
            this.conectar();
            String sql="delete from juntavotos where numjuntavotos=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, jr.getNumjuntavotos());
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
    
    public List<CentroVotos> lsCV() throws Exception
    {
        ResultSet rs;
        List<CentroVotos> lsCV=new ArrayList<>();
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
                lsCV.add(cv);
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsCV;
    }
    
    public List<DelegadoInternacional> lsDI() throws Exception
    {
        ResultSet rs;
        List<DelegadoInternacional> lsDel=new ArrayList<>();
        try {
            this.conectar();
            String sql="select * from delegadointer";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            rs=pre.executeQuery();
            while(rs.next())
            {
                DelegadoInternacional di=new DelegadoInternacional();
                di.setIddelegado(rs.getInt("iddelegado"));
                di.setNombre(rs.getString("nombre"));
                di.setNacionalidad(rs.getString("nacionalidad"));
                di.setGenero(rs.getString("genero"));
                di.setTelefono(rs.getString("telefono"));
                di.setDireccion(rs.getString("direccion"));
                lsDel.add(di);
            }
        } catch (Exception e) {
            throw e;
        }
        finally{
            this.desconectar();
        }
        return lsDel;
    }
}
