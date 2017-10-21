/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.UsuarioIngreso;
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
 * @author Rivera
 */
public class IniciarSesio extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion=request.getSession();
        RequestDispatcher rd=null;
        if(request.getParameter("btnEnviar")!=null)
        {
            String usuario=request.getParameter("txtUsu");
            String clave=request.getParameter("txtClave");
            UsuarioIngreso ob=new UsuarioIngreso();
             
            switch(ob.acceder(usuario, clave)){
               
                case 1:
                    
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nivel", "1");
                    response.sendRedirect("jsp/vistaAdm.jsp");
                    break;
                
                    case 2:
                    
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nivel", "2");
                    response.sendRedirect("jsp/vistaEmp.jsp");
                    break;
                    
                    case 3:
                    
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("nivel", "3");
                    response.sendRedirect("jsp/vistaDelegado.jsp");
                    break;
                    
                    default:
                        out.print("<script>alert('CREDENCIALES INCORRECTAS');</script>");
                        out.print("<script>location.replace('admin/');</script>");
                    break;
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(IniciarSesio.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(IniciarSesio.class.getName()).log(Level.SEVERE, null, ex);
        }
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
