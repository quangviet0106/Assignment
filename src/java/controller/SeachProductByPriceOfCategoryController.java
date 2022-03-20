/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class SeachProductByPriceOfCategoryController extends HttpServlet {

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
        int cid = Integer.parseInt(request.getParameter("cid"));
        CategoryDBContext dbCategory = new CategoryDBContext();
        ArrayList<Category> category = dbCategory.getCategory();
        Category c = dbCategory.getCategoryById(cid);
        request.setAttribute("categorybyid", c);
        request.setAttribute("category", category);
        String price = request.getParameter("price");
        String price1 = request.getParameter("price1");
        String price2 = request.getParameter("price2");
        String price3 = request.getParameter("price3");
        int count = 0;
        ArrayList<Product> product = new ArrayList<>();
        ProductDBContext db = new ProductDBContext();
        if(price!=null){
           product = db.SearchProductByPriceOfCategory(price,cid);
           count = db.countProductByPriceOfCategory(price, cid);
           request.getSession().setAttribute("urlHistory", "searchproductbypriceofcategory?cid="+cid+"&&price="+price);
        }
        if(price1!=null){
           product = db.SearchProductByPriceOfCategory1(price1, cid);
           count = db.countProductByPriceOfCategory1(price1, cid);
           request.getSession().setAttribute("urlHistory", "searchproductbypriceofcategory?cid="+cid+"&&price1="+price1);
        }
        if(price2!=null){
           product = db.SearchProductByPriceOfCategory2(price2, cid);
           count = db.countProductByPriceOfCategory2(price2, cid);
           request.getSession().setAttribute("urlHistory", "searchproductbypriceofcategory?cid="+cid+"&&price2="+price2);
        }
        if(price3!=null){
           product = db.SearchProductByPriceOfCategory3(price3, cid);
           count = db.countProductByPriceOfCategory3(price3, cid);
           request.getSession().setAttribute("urlHistory", "searchproductbypriceofcategory?cid="+cid+"&&price3="+price3);
        }
        
        request.setAttribute("product", product);
        request.setAttribute("counts", count);
        
        request.getRequestDispatcher("view/SearchProductByCategory.jsp").forward(request, response);
        
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
