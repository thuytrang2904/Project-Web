/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trangbtt.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trangbtt.daos.BillDAO;
import trangbtt.daos.RoomDAO;
import trangbtt.dtos.CartAddDTO;
import trangbtt.dtos.RoomErrorObject;
import trangbtt.models.Cart;
import trangbtt.models.CartBean;

/**
 *
 * @author ASUS
 */
public class OrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userCart.jsp";
    private static final String INVALID = "userCart.jsp";

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
            if (shoppingCart != null) {
                RoomDAO dao = new RoomDAO();
                List<CartBean> cartb = null;
                cartb = new ArrayList<>();
                CartBean bean = null;
                for (CartAddDTO dto : shoppingCart.getCart()) {
                    bean = new CartBean();

                    bean.setPhone((String) session.getAttribute("PHONE"));
                    bean.setRoomID(dto.getRoomID());
                    bean.setFrom( dto.getFrom());
                    bean.setTo( dto.getTo());
                    bean.setAdult(dto.getAdult());
                    bean.setChild(dto.getChild());
                    bean.setPrice(dto.getPrice());
                    bean.setStatus("Wait");
                    cartb.add(bean);
                }
                for (CartBean cartBean : cartb) {
                    bean.insertBooking();
                }
                List<Integer> result = bean.loadIDB();
                if (result != null) {
                    for (int k = 0; k < result.size(); k++) {
                        bean.setIdBill(result.get(k));
                        if (bean.insertBill()) {
                            if (dao.updateStatus(bean.getRoomID())) {

                                url = SUCCESS;
                                session.setAttribute("cart", null);

                            }
                        } else {
                            System.out.println("ERROR BILL");
                        }
                    }
                }

            } else {
                url = ERROR;

            }

        } catch (Exception e) {
            log("Error at OrderController " + e.getMessage());
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
