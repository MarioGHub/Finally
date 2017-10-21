/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Rivera
 */
public class CrudCandidato extends Conexion{
    
    public List<Candidato> mostrar() throws Exception
    {
        ResultSet res;
        List <Candidato> lista=new ArrayList<>();
        try {
            this.conectar();
            String sql="select * from candidato";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Candidato can=new Candidato();
                can.setIdCandidato(res.getInt("idcandidato"));
                can.setIdPartido(res.getInt("idpartido"));
                can.setNombre(res.getString("nombre"));
                can.setGenero(res.getString("genero"));
                can.setEdad(res.getInt("edad"));
                can.setTelefono(res.getString("telefono"));
                can.setDireccion(res.getString("direccion"));
                lista.add(can);
            }
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return lista;
    }
    
    public List<Partido> listaPartido() throws Exception
    {
        ResultSet res;
        List <Partido> listaP=new ArrayList<>();
        try {
            this.conectar();
            String sql="select * from partido";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Partido par=new Partido();
              
                par.setIdPartido(res.getInt("idpartido"));
                par.setNombre(res.getString("nombrepartido"));
              
                listaP.add(par);
            }
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
        return listaP;
    }
    
    public void insertar(Candidato can) throws Exception
    {
        try {
            this.conectar();
            String sql="insert into candidato values(?,?,?,?,?,?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, can.getIdCandidato());
            pre.setInt(2, can.getIdPartido());
            pre.setString(3, can.getNombre());
            pre.setString(4, can.getGenero());
            pre.setInt(5, can.getEdad());
            pre.setString(6, can.getTelefono());
            pre.setString(7, can.getDireccion());
            pre.executeUpdate();
            
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void modificar(Candidato can) throws Exception
    {
        try {
            this.conectar();
            String sql="update candidato set idpartido=?, nombre=?, genero=?, edad=?, telefono=?, direccion=? where idcandidato=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            pre.setInt(1, can.getIdPartido());
            pre.setString(2, can.getNombre());
            pre.setString(3, can.getGenero());
            pre.setInt(4, can.getEdad());
            pre.setString(5, can.getTelefono());
            pre.setString(6, can.getDireccion());
            pre.setInt(7, can.getIdCandidato());
            pre.executeUpdate();
            
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
    
    public void eliminar(Candidato can) throws Exception
    {
        try {
            this.conectar();
            String sql="delete from candidato where idcandidato=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            
            
            pre.setInt(1, can.getIdCandidato());
            pre.executeUpdate();
            
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
    }
}
