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
import trangbtt.daos.RoomDAO;
import trangbtt.dtos.RoomErrorObject;
import trangbtt.models.RoomAction;

/**
 *
 * @author ASUS
 */
public class UpdateRoomController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "adminRoom.jsp";
    private static final String INVALID = "editRoom.jsp";

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
            String id = request.getParameter("id");
            String type = request.getParameter("txtType");
            String price = request.getParameter("txtPrice");
            String max = request.getParameter("txtMax");
            String status = request.getParameter("txtStatus");
            System.out.println(id);
            System.out.println(type);
            System.out.println(price);
            System.out.println(max);
            System.out.println(status);
            RoomErrorObject err = new RoomErrorObject();
            boolean valid = true;
            if (id.length() == 0) {
                err.setRoomIDErr("ID can't be blank");
                valid = false;
            }
            if (type.length() == 0) {
                err.setTypeErr("Room Type can't be blank");
                valid = false;
            }
            if (price.length() == 0) {
                err.setPriceErr("Price can't be blank");
                valid = false;
            }
            if (max.length() == 0) {
                err.setMaxErr("Max person can't be blank");
                valid = false;
            }
            if (!id.matches("^[0-9]*$")) {
                err.setRoomIDErr("ID does not contain special character");
                valid = false;
            }
            if (!price.matches("^[0-9]*$")) {
                err.setPriceErr("Price does not contain special character");
                valid = false;
            }
            if (!max.matches("^[0-9]*$")) {
                err.setMaxErr("Max person does not contain special character");
                valid = false;
            }
            int priceP = Integer.parseInt(price);
            int maxP = Integer.parseInt(max);
            int idP = Integer.parseInt(id);

            if (valid) {
                RoomAction bean = new RoomAction();
                bean.setRoomID(idP);
                bean.setType(type);
                bean.setPrice(priceP);
                bean.setMax(maxP);
                bean.setStatus(status);
                if (bean.update()) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Update Failed");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", err);

            }

        } catch (Exception e) {
            log("ERROR at InsertRoomController " + e.getMessage());
            
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
