
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.CrudDepto;
import com.modelo.CrudJunta;
import com.modelo.Departamento;
import com.modelo.JuntaReceptora;
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
public class ProcesarJunta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        JuntaReceptora jr=new JuntaReceptora();
        CrudJunta crudJunta= new CrudJunta();
        String val=null;
        RequestDispatcher rd=null;
        try
        {
            jr.setNumjuntavotos(Integer.parseInt(request.getParameter("numjuntavotos")));
            jr.setNumcentro(Integer.parseInt(request.getParameter("numcentro")));
            jr.setIddelegado(Integer.parseInt(request.getParameter("iddelegado")));
            jr.setNombre(request.getParameter("nombre"));
            jr.setCantidadPapeletas(Integer.parseInt(request.getParameter("cantidadpapeletas")));
            jr.setCargo(request.getParameter("cargo"));
            jr.setGenero(request.getParameter("genero"));
            jr.setFechanac(request.getParameter("fechanac"));
            jr.setDireccion(request.getParameter("direccion"));
            jr.setTelefono(request.getParameter("telefono"));
            if(request.getParameter("ingresar")!=null)
            {
                crudJunta.insertar(jr);
                val="Datos insertados correctamente";
            }
            else if(request.getParameter("modificar")!=null)
            {
                crudJunta.modificar(jr);
                val="Datos modificados correctamente";
            }
            else if(request.getParameter("eliminar")!=null)
            {
                crudJunta.eliminar(jr);
                val="Datos eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("jsp/admJRV.jsp");
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
