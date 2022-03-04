/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.CartDetail;

/**
 *
 * @author Admin
 */
public class OrderDetailDBContext extends DBContext{

    public void saveCart(int orderId, Cart cart) {
        try {
            String sql="INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([order_id]\n"
                    +"           ,[productName]\n"
                    +"           ,[productImage]\n"
                    +"           ,[productPrice]\n"
                    +"           ,[productColor]\n"
                    +"           ,[productSize]\n"
                    +"           ,[quantity])\n"
                    +"     VALUES\n"
                    +"           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            for (CartDetail c : cart.getDetails()) {
                stm.setString(2, c.getProduct().getPname());
                stm.setString(3, c.getProduct().getPimage());
                stm.setDouble(4, c.getProduct().getPrice());
                stm.setString(5, c.getProduct().getPcolor());
                stm.setInt(6, c.getProduct().getSize());
                stm.setInt(7, c.getQuantity());
                stm.executeUpdate();
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
