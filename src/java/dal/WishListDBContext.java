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
import model.Account;
import model.Product;
import model.WishList;

/**
 *
 * @author Admin
 */
public class WishListDBContext extends DBContext{
    public void insertWishList(WishList list){
        try {
            String sql = "INSERT INTO [WishList]\n" +
                    "           ([wid]\n" +
                    "           ,[wname]\n" +
                    "           ,[wimage]\n" +
                    "           ,[price]\n" +
                    "           ,[pcolor]\n" +
                    "           ,[size]\n" +
                    "           ,[username_id]\n" +
                    "           ,[productid])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, list.getWid());
            stm.setString(2, list.getWname());
            stm.setString(3, list.getWimage());
            stm.setInt(4, list.getPrice());
            stm.setString(5, list.getColor());
            stm.setInt(6, list.getSize());
            stm.setString(7, list.getAccount().getUsername());
            stm.setInt(8, list.getProduct().getPid());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<WishList> getWishList(){
        ArrayList<WishList> list = new ArrayList<>();
        try {
            String sql = "Select * from WishList";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                WishList wl = new WishList();
                wl.setWid(rs.getInt(1));
                wl.setWname(rs.getString(2));
                wl.setWimage(rs.getString(3));
                wl.setPrice(rs.getInt(4));
                wl.setColor(rs.getString(5));
                wl.setSize(rs.getInt(6));
                Account acount = new Account();
                acount.setUsername(rs.getString(7));
                wl.setAccount(acount);
                Product p = new Product();
                p.setPid(rs.getInt(8));
                wl.setProduct(p);
                list.add(wl);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public void deleteWishList(int wid){
        try {
            String sql = "DELETE FROM WishList where wid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, wid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
