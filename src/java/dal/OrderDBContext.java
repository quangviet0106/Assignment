/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author Admin
 */
public class OrderDBContext extends DBContext{

    public int createOrder(Order order) {
       try {
            String sql = "INSERT INTO [dbo].[Orders]\n" 
                            +"           ([username]\n" 
                            +"           ,[totalPrice]\n" 
                            +"           ,[note]\n" 
                            +"           ,[shipping_id])\n" 
                            +"     VALUES\n" 
                            +"           (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            stm.setString(1, order.getUsername());
            stm.setDouble(2, order.getTotalPrice());
            stm.setString(3, order.getNote());
            stm.setInt(4, order.getShippingId());
            stm.executeLargeUpdate();
            
            ResultSet rs = stm.getGeneratedKeys();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShippingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
}
