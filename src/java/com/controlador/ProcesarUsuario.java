/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.CrudDepto;
import com.modelo.CrudUsuario;
import com.modelo.Departamento;
import com.modelo.Usuario;
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
public class ProcesarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Usuario usu=new Usuario();
        CrudUsuario crudUsu= new CrudUsuario();
        String val=null;
        RequestDispatcher rd=null;
        try
        {
            usu.setId(Integer.parseInt(request.getParameter("codUsuario")));
            usu.setUserName(request.getParameter("username"));
            usu.setClave(request.getParameter("clave"));
            usu.setTipo(Integer.parseInt(request.getParameter("tipo")));
            if(request.getParameter("ingresar")!=null)
            {
                crudUsu.insertar(usu);
                val="Datos insertados correctamente";
            }
            else if(request.getParameter("modificar")!=null)
            {
                crudUsu.modiifcar(usu);
                val="Datos modificados correctamente";
            }
            else if(request.getParameter("eliminar")!=null)
            {
                crudUsu.eliminar(usu);
                val="Datos eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("admUsu.jsp");
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
