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
            pr.setPrice(rs.getInt(5));
            pr.setPcolor(rs.getString(6));
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
}

