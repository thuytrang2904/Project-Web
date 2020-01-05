/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import trangbtt.dtos.RegistrationErrorObject;
import trangbtt.models.LoginAction;

/**
 *
 * @author ASUS
 */
public class SignUpController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "index.jsp";
    private static final String INVALID = "signUp.jsp";

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
        String url = ERROR;
        try {
            String phone = request.getParameter("txtPhone");
            String fullname = request.getParameter("txtFullname");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");

            RegistrationErrorObject err = new RegistrationErrorObject();
            boolean valid = true;

            if (phone.length() == 0 || phone.length() > 10) {
                err.setPhoneErr("Phone must be 10 character");
                valid = false;
            }
            if (!phone.matches("^[0-9]*$")) {
                err.setPhoneErr("Phone does not contain special character");
                valid = false;
            }
            if (password.length() == 0) {
                err.setPasswordErr("Password can't be blank");
                valid = false;
            }
            if (password.length() < 5) {
                err.setPasswordErr("Password must be greater than 5 character");
                valid = false;
            }
            if(!confirm.equals(password)){
                err.setConfirmErr("Confirm must match Password");
                valid = false;
            }
             if(confirm.length() == 0){
                err.setConfirmErr("Confirm can't be blank");
                valid = false;
            }
            if (fullname.length() == 0) {
                err.setFullnameErr("Fullname can't be blank");
                valid = false;
            }

            if (valid) {
                LoginAction bean = new LoginAction();
                bean.setPhone(phone);
                bean.setPassword(password);
                bean.setFullname(fullname);

                if (bean.insert()) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", err);
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", err);
            }

        } catch (Exception e) {
            log("Error at SignUpController " + e.getMessage());
            if(e.getMessage().contains("duplicate")){
                RegistrationErrorObject errObj = new RegistrationErrorObject();
                errObj.setPhoneErr("Phone is exited");
                url = INVALID;
                request.setAttribute("INVALID", errObj);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
