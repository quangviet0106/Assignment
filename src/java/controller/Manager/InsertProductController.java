/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Manager;

import controller.Login.BaseAuthenticationController;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class InsertProductController extends BaseAuthenticationController {

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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> categorys = dbCategory.getCategory();
        request.setAttribute("category", categorys);
        request.getRequestDispatcher("view/InsertProduct.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int pid = Integer.parseInt(request.getParameter("pid"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        int price = Integer.parseInt(request.getParameter("price"));
        String color = request.getParameter("color");
        int size = Integer.parseInt(request.getParameter("size"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        
        Category c = new Category();
        c.setCid(cid);
        Product p = new Product();
        p.setPid(pid);
        p.setPname(name);
        p.setPdescription(description);
        p.setPimage(image);
        p.setPrice(price);
        p.setPcolor(color);
        p.setSize(size);
        p.setQuantity(quantity);
        p.setCate(c);
        
        ProductDBContext dbProduct = new ProductDBContext();
        dbProduct.InsertProduct(p);
        response.sendRedirect("manager");
        
        
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
