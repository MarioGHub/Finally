/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.CrudMunicipio;
import com.modelo.CrudVotante;
import com.modelo.Municipio;
import com.modelo.Votante;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rivera
 */
public class ProcesarVotante extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Votante vot=new Votante();
        CrudVotante crudVot= new CrudVotante();
        String val=null;
        RequestDispatcher rd=null;
        try
        {
            vot.setDui(request.getParameter("dui"));
            vot.setNombre(request.getParameter("nombre"));
            vot.setDireccion(request.getParameter("direccion"));
            vot.setGenero(request.getParameter("genero"));
            vot.setAnionacimiento(Integer.parseInt(request.getParameter("anio")));
            vot.setApellido(request.getParameter("apellido"));
            vot.setDepartamento(Integer.parseInt(request.getParameter("departamento")));
            vot.setMunicipio(Integer.parseInt(request.getParameter("municipio")));
            vot.setCentro(Integer.parseInt(request.getParameter("centro")));
            vot.setPregunta(request.getParameter("pregunta"));
            vot.setPass(request.getParameter("pass"));
            if(request.getParameter("ingresar")!=null)
            {
                crudVot.insertar(vot);
                val="Datos insertados correctamente";
            }
            else if(request.getParameter("modificar")!=null)
            {
                crudVot.modificar(vot);
                val="Datos modificados correctamente";
            }
            else if(request.getParameter("eliminar")!=null)
            {
                crudVot.eliminar(vot);
                val="Datos eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("admVot.jsp");
            request.setAttribute("valor", val);
            }
        catch (Exception e)
        {
            request.setAttribute("error", e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
