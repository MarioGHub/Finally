/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.UsuarioIngreso;
import com.modelo.VotanteIngreso;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VA
 */
public class IniciarSesionV extends HttpServlet {

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
        HttpSession sesion=request.getSession();
        RequestDispatcher rd=null;
        if(request.getParameter("btnEnviar")!=null)
        {
            String usuario=request.getParameter("txtUsu");
            String clave=request.getParameter("txtClave");
            String respuesta=request.getParameter("txtRespuesta");
            //crear campo respuesta para que funcione este servlet :v
            VotanteIngreso vi=new VotanteIngreso();
             
            try {
                switch(vi.accederV(usuario, clave, respuesta)){
                    
                    case 4:
                        
                        sesion.setAttribute("usuario", usuario);
                        sesion.setAttribute("nivel", "4");
                        response.sendRedirect("jsp/vistaVotante.jsp");
                        break;
                        
                    default:
                        out.print("<script>alert('CREDENCIALES INCORRECTAS');</script>");
                        out.print("<script>location.replace('./');</script>");
                    break;
                }
            } catch (Exception ex) {
                Logger.getLogger(IniciarSesionV.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(request.getParameter("close")!=null)
            {
                sesion.invalidate();
            }
        }
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
