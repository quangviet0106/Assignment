/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDBContext;
import dal.ProductDBContext;
import dal.RateDBContext;

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
 * @author DELL
 */
public class DetailsController extends HttpServlet {

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
        String raw_id = request.getParameter("pid");
        int id = Integer.parseInt(raw_id);
        ProductDBContext dbProduct = new ProductDBContext();
        Product product = dbProduct.getProductByID(id);
        request.setAttribute("detail",product);
        ArrayList<Product> p = dbProduct.getNewProducts();
        request.setAttribute("newproducts", p);
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> categorys = dbCategory.getCategory();
        request.setAttribute("category", categorys);
        RateDBContext dbRate = new RateDBContext();
        int sumRate1 = dbRate.sumRate1(id);
        int sumRate2 = dbRate.sumRate2(id);
        int sumRate3 = dbRate.sumRate3(id);
        int sumRate4 = dbRate.sumRate4(id);
        int sumRate5 = dbRate.sumRate5(id);
        request.setAttribute("rate1", sumRate1);
        request.setAttribute("rate2", sumRate2);
        request.setAttribute("rate3", sumRate3);
        request.setAttribute("rate4", sumRate4);
        request.setAttribute("rate5", sumRate5);
        request.getRequestDispatcher("view/Detail.jsp").forward(request, response);
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
