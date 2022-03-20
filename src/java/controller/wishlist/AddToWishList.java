/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.wishlist;

import controller.Login.BaseAuthenticationController;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import dal.WishListDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Category;
import model.Product;
import model.WishList;

/**
 *
 * @author Admin
 */
public class AddToWishList extends BaseAuthenticationController {

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
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> categorys = dbCategory.getCategory();
        request.setAttribute("category", categorys);
        int pid = Integer.parseInt(request.getParameter("id"));
        ProductDBContext db = new ProductDBContext();
        Product product = db.getProductByID(pid);
        WishList list = new WishList();
        list.setWname(product.getPname());
        list.setWimage(product.getPimage());
        list.setPrice(product.getPrice());
        list.setColor(product.getPcolor());
        list.setSize(product.getSize());
        Account account = (Account) request.getSession().getAttribute("account");
        list.setAccount(account);
        list.setProduct(product);
        WishListDBContext dbWish = new WishListDBContext();
        WishList wishlist = dbWish.checkProductExistInWishlist(account.getUsername(), pid);
        if(wishlist == null){
            dbWish.insertWishList(list);
            HttpSession session = request.getSession();
            String urlHistory = (String)session.getAttribute("urlHistory");
            if(urlHistory == null){
            urlHistory = "home";
            }
        response.sendRedirect(urlHistory);
        }
        else{
            request.setAttribute("warning", "Bạn đã thêm sản phẩm vừa chọn vào danh sách yêu thích rồi, vui lòng chọn sản phẩm yêu thích khác!");
            request.getRequestDispatcher("view/WarningWishListExisted.jsp").forward(request, response);
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
