package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author VA
 */
public class VotanteIngreso extends Conexion {

    public int acceder(String Dui, String Pass, String Pregunta) throws Exception {
        int depto = 0;

        ResultSet res;
        try {
            this.conectar();
            String sql = "select departamento from votante where dui=? and pass=? and pregunta=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, Dui);
            pre.setString(2, Pass);
            pre.setString(3, Pregunta);

            res = pre.executeQuery();
            while (res.next()) {
                depto = res.getInt("departamento");

            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return depto;
    }
}
