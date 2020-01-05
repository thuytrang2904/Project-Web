/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trangbtt.daos.BookingDAO;
import trangbtt.dtos.BookingDTO;
import trangbtt.models.BookingBean;

/**
 *
 * @author ASUS
 */
public class UpdateBillController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "staff.jsp";

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
    
            String inC = request.getParameter("cbIn");
            String outC = request.getParameter("cbOut");
            System.out.println(inC);
            boolean in = Boolean.parseBoolean(inC);
            boolean out = Boolean.parseBoolean(outC);
            System.out.println("in" + in);
            System.out.println("on" + out);
            HttpSession session = request.getSession();
            String search = (String) session.getAttribute("search");
            System.out.println(search);
            BookingBean beans = new BookingBean();
            beans.setSearchValue(search);

            List<BookingDTO> result = beans.findByLikePhone();
            int id = 0;
            if (result != null) {
                System.out.println("Hello Result");
                for (BookingDTO dto : result) {
                    id = dto.getRoomID();
                }
            }

            BookingDAO dao = new BookingDAO();

//            if (dao.updateBill(in, out, search)) {
//                System.out.println("Phone: " + search);
//                if (in == true && out == true) {
//                    System.out.println("UPDATE");
//                    dao.updateBillStatus(search);
//                    dao.updateStatusRoomFinish(id);
//                    url = SUCCESS;
//                } else {
//                    url = SUCCESS;
//                }
//
//            } else {
//                url = ERROR;
//            }

        } catch (Exception e) {
            log("ERROR at UpdateBillroller" + e.getMessage());
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
