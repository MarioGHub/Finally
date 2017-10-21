package com.modelo;


import com.conexion.Conexion;
import com.modelo.Partido;
import java.sql.*;
import java.util.*;


public class CrudPartido extends Conexion{
    
    public List<Partido> mostrar() throws Exception
    {
        ResultSet res;
        List <Partido> lista=new ArrayList<>();
        try {
            this.conectar();
            String sql="select * from partido";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next())
            {
                Partido part=new Partido();
                part.setIdPartido(res.getInt("idpartido"));
                part.setNombre(res.getString("nombrepartido"));
                lista.add(part);
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
    
    public void insertar(Partido par) throws Exception
    {
        try {
            this.conectar();
            String sql="insert into partido values(?,?)";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, par.getIdPartido());
            pre.setString(2, par.getNombre());
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
       
    }
    
    public void modificar(Partido par) throws Exception
    {
        try {
            this.conectar();
            String sql="update partido set nombrepartido=? where idpartido=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setString(1, par.getNombre());
            pre.setInt(2, par.getIdPartido()); 
            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
        finally
        {
            this.desconectar();
        }
       
    }
    
    public void eliminar(Partido par) throws Exception
    {
        try {
            this.conectar();
            String sql="delete from partido where idpartido=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, par.getIdPartido()); 
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
