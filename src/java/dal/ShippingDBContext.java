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
import model.Shipping;

/**
 *
 * @author Admin
 */
public class ShippingDBContext extends DBContext{

    public int createShipping(Shipping shipping) {
        try {
            String sql = "INSERT INTO [dbo].[Shipping]\n"
                        +"           ([name]\n" 
                        +"           ,[phone]\n" 
                        +"           ,[address])\n" 
                        +"     VALUES\n" 
                        +"           (?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            stm.setString(1, shipping.getName());
            stm.setString(2, shipping.getPhone());
            stm.setString(3, shipping.getAddress());
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
