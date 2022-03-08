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
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class ManagerOrderDBContext extends DBContext{
    public ArrayList<OrderDetail> getOrderDetail(){
        ArrayList<OrderDetail> orderdetails = new ArrayList<>();
        try {
            String sql = "Select * from OrderDetail";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                OrderDetail o = new OrderDetail();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getInt(2));
                o.setProductName(rs.getString(3));
                o.setProductImage(rs.getString(4));
                o.setProductPrice(rs.getInt(5));
                o.setProductColor(rs.getString(6));
                o.setProductSize(rs.getInt(7));
                o.setQuantity(rs.getInt(8));
                orderdetails.add(o);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderdetails;
    }
    
}
