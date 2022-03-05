/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDBContext;
import dal.OrderDBContext;
import dal.OrderDetailDBContext;
import dal.ShippingDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.Order;
import model.Shipping;

/**
 *
 * @author Admin
 */
public class CheckOutController extends HttpServlet {

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
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> categorys = dbCategory.getCategory();
        request.setAttribute("category", categorys);
        request.getRequestDispatcher("view/CheckOut.jsp").forward(request, response);
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
        
       request.setCharacterEncoding("UTF-8");
       response.setCharacterEncoding("UTF-8");
       String name = request.getParameter("name");
       String phone = request.getParameter("phone");
       String address = request.getParameter("address");
       String note = request.getParameter("note");
       
       Shipping shipping = new Shipping();
       shipping.setName(name);
       shipping.setPhone(phone);
       shipping.setAddress(address);
       ShippingDBContext db = new ShippingDBContext();
       int shippingId = db.createShipping(shipping);
       HttpSession session = request.getSession();
       Cart cart = (Cart) session.getAttribute("carts");
       Order order = new Order();
       order.setUsername("huy");
       order.setShippingId(shippingId);
       order.setTotalPrice(cart.getTotal());
       order.setNote(note);
       int orderId = new OrderDBContext().createOrder(order);
        
        
         if(cart == null)
            cart = new Cart();
        new OrderDetailDBContext().saveCart(orderId,cart);
        session.removeAttribute("carts");
        response.sendRedirect("Thanks");
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
