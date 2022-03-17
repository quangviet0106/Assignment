/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.Login.BaseAuthenticationController;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import dal.RateDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Category;
import model.Product;
import model.Rate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RateController", urlPatterns = {"/rate"})
public class RateController extends BaseAuthenticationController {

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
        int pid = Integer.parseInt(request.getParameter("pid"));
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> categorys = dbCategory.getCategory();
        request.setAttribute("category", categorys);
        ProductDBContext db = new ProductDBContext();
        Product product = db.getProductByID(pid);
        request.setAttribute("detail",product);
        String raw_rate1 = request.getParameter("rating1");
        String raw_rate2 = request.getParameter("rating2");
        String raw_rate3 = request.getParameter("rating3");
        String raw_rate4 = request.getParameter("rating4");
        String raw_rate5 = request.getParameter("rating5");
        Rate rate = new Rate();
        int rate1,rate2,rate3,rate4,rate5;
        Account account = (Account) request.getSession().getAttribute("account");
        
        if(raw_rate1 != null){
            rate1 = Integer.parseInt(raw_rate1);
            rate2 = 0;
            rate3 = 0;
            rate4 = 0;
            rate5 = 0;
            rate.setRate1(rate1);
            rate.setRate2(rate2);
            rate.setRate3(rate3);
            rate.setRate4(rate4);
            rate.setRate5(rate5);
            rate.setAccount(account);
            rate.setProduct(product);
        }
        if(raw_rate2 != null){
            rate1 = 0;
            rate2 = Integer.parseInt(raw_rate2);
            rate3 = 0;
            rate4 = 0;
            rate5 = 0;
            rate.setRate1(rate1);
            rate.setRate2(rate2);
            rate.setRate3(rate3);
            rate.setRate4(rate4);
            rate.setRate5(rate5);
            rate.setAccount(account);
            rate.setProduct(product);
        }
        if(raw_rate3 != null){
            rate1 = 0;
            rate2 = 0;
            rate3 = Integer.parseInt(raw_rate3) ;
            rate4 = 0;
            rate5 = 0;
            rate.setRate1(rate1);
            rate.setRate2(rate2);
            rate.setRate3(rate3);
            rate.setRate4(rate4);
            rate.setRate5(rate5);
            rate.setAccount(account);
            rate.setProduct(product);
        }
        if(raw_rate4 != null){
            rate1 = 0;
            rate2 = 0;
            rate3 = 0 ;
            rate4 = Integer.parseInt(raw_rate4);
            rate5 = 0;
            rate.setRate1(rate1);
            rate.setRate2(rate2);
            rate.setRate3(rate3);
            rate.setRate4(rate4);
            rate.setRate5(rate5);
            rate.setAccount(account);
            rate.setProduct(product);
        }
        if(raw_rate5 != null){
            rate1 = 0;
            rate2 = 0;
            rate3 = 0;
            rate4 = 0;
            rate5 = Integer.parseInt(raw_rate5);
            rate.setRate1(rate1);
            rate.setRate2(rate2);
            rate.setRate3(rate3);
            rate.setRate4(rate4);
            rate.setRate5(rate5);
            rate.setAccount(account);
            rate.setProduct(product);
        }
        RateDBContext dbRate = new RateDBContext();
        dbRate.insertRate(rate);
        int sumRate1 = dbRate.sumRate1(pid);
        int sumRate2 = dbRate.sumRate2(pid);
        int sumRate3 = dbRate.sumRate3(pid);
        int sumRate4 = dbRate.sumRate4(pid);
        int sumRate5 = dbRate.sumRate5(pid);
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
