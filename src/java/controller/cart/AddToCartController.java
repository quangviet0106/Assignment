/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import controller.Login.BaseAuthenticationController;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartDetail;



import model.Product;

/**
 *
 * @author Admin
 */
public class AddToCartController extends BaseAuthenticationController {

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
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("carts");
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDBContext dbProduct = new ProductDBContext();
        Product product = dbProduct.getProductByID(id);
        
        if(cart == null)
            cart = new Cart();
        boolean isExist = false;
        for (CartDetail detail : cart.getDetails()) {
            if(detail.getProduct().getPid() == product.getPid()){
                isExist = true;
                detail.setQuantity(detail.getQuantity()+1);
                break;
            }
        }
        if(!isExist){
            CartDetail detail = new CartDetail();
            detail.setProduct(product);
            detail.setOrder(cart);
            detail.setQuantity(1);
            detail.setPrice(product.getPrice());
            cart.getDetails().add(detail);
        }
        session.setAttribute("carts", cart);
        String urlHistory = (String)session.getAttribute("urlHistory");
        if(urlHistory == null){
            urlHistory = "home";
        }
        response.sendRedirect(urlHistory);
        
        
        
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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
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
