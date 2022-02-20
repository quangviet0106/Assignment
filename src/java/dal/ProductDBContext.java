/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class ProductDBContext extends DBContext {
    public ArrayList<Product> getProducts(){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "Select * from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
        while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getDouble(5));
            pr.setPcolor(rs.getString(6));
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getProductByCategory(int cid){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "Select p.pid,p.pname,p.pdescription,p.pimage,p.price,p.pcolor from Product p INNER JOIN Category c ON p.cid = c.cid WHERE c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
        while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt("pid"));
            pr.setPname(rs.getString("pname"));
            pr.setPdescription(rs.getString("pdescription"));
            pr.setPimage(rs.getString("pimage"));
            pr.setPrice(rs.getDouble("price"));
            pr.setPcolor(rs.getString("pcolor"));
            
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public Product getProductByID(int id){
        
        try {
            String sql = "Select * from Product WHERE pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
        if(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getDouble(5));
            pr.setPcolor(rs.getString(6));
            return pr;
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

