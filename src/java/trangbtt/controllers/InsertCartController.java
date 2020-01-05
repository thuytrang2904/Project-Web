/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trangbtt.daos.RoomDAO;
import trangbtt.dtos.CartAddDTO;
import trangbtt.models.Cart;

/**
 *
 * @author ASUS
 */
public class InsertCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userReserver.jsp";

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
            HttpSession session = request.getSession();
            Cart shoppingCart = (Cart) session.getAttribute("cart");

            String from = request.getParameter("txtFrom");
            String to = request.getParameter("txtTo");
            String adult = request.getParameter("txtAdult");
            String child = request.getParameter("txtChild");
            String room = request.getParameter("txtRoom");
            String valid = "";

            if (room == null) {
                valid += "Room can't be blank\n";
            }
            RoomDAO dao = new RoomDAO();
            int adultP = 0;
            String[] tmp = null;
            try {
                tmp = room.split(" ");
                int roomID = Integer.parseInt(tmp[0]);
                adultP = Integer.parseInt(adult);
                if (dao.maxPerson(roomID) < adultP) {
                    valid += "Max Person is " + dao.maxPerson(roomID);
                }
            } catch (Exception e) {
                valid += "Can't parseInt\n";
            }

            if (to.length() == 0) {
                valid += "Check out date can't be blank\n";
            }

            if (from.length() == 0) {
                valid += "Check in date can't be blank\n";

            }
            if (adult.length() == 0) {
                valid += "Adult can't be blank\n";

            }
            if (child.length() == 0) {
                valid += "Child can't be blank\n";

            }
            
            if (shoppingCart == null) {
                shoppingCart = new Cart();

            }
            System.out.println(room);
            if (valid.equals("")) {
                CartAddDTO dto = new CartAddDTO();
                tmp = room.split(" ");
                dto.setFrom(from);
                dto.setTo(to);
                dto.setAdult(adultP);
                dto.setChild(Integer.parseInt(child));
                dto.setRoomID(Integer.parseInt(tmp[0]));
                dto.setType(tmp[1]);
                dto.setPrice(Integer.parseInt(tmp[2]));

                shoppingCart.addToCard(dto);
                session.setAttribute("cart", shoppingCart);
                url = SUCCESS;
            } else {
                url = ERROR;
                request.setAttribute("ERROR", valid);
            }

        } catch (Exception e) {
            log("ERROR at ADD Cart " + e.getMessage());
            url = ERROR;

            request.setAttribute("ERROR", e.getMessage());

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
