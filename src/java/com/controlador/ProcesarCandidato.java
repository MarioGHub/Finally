/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Candidato;
import com.modelo.CrudCandidato;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VA
 */
public class ProcesarCandidato extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Candidato can=new Candidato();
        CrudCandidato crudCan=new CrudCandidato();
        String val=null;
        RequestDispatcher rd=null;
        try
        {
            can.setIdCandidato(Integer.parseInt(request.getParameter("idcandidato")));
            can.setIdPartido(Integer.parseInt(request.getParameter("idpartido")));
            can.setNombre(request.getParameter("nombre"));
            can.setGenero(request.getParameter("genero"));
            can.setEdad(Integer.parseInt(request.getParameter("edad")));
            can.setTelefono(request.getParameter("telefono"));
            can.setDireccion(request.getParameter("direccion"));
            if(request.getParameter("ingresar")!=null)
            {
                crudCan.insertar(can);
                val="Datos insertados correctamente";
            }
            else if(request.getParameter("modificar")!=null)
            {
                crudCan.modificar(can);
                val="Datos modificados correctamente";
            }
            else if(request.getParameter("eliminar")!=null)
            {
                crudCan.eliminar(can);
                val="Datos eliminados correctamente";
            }
            
            rd=request.getRequestDispatcher("jsp/admCan.jsp");
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
