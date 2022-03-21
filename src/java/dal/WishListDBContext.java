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
                              "("+
                    "           [wname]\n" +
                    "           ,[wimage]\n" +
                    "           ,[price]\n" +
                    "           ,[pcolor]\n" +
                    "           ,[size]\n" +
                    "           ,[username_id]\n" +
                    "           ,[productid])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, list.getWname());
            stm.setString(2, list.getWimage());
            stm.setInt(3, list.getPrice());
            stm.setString(4, list.getColor());
            stm.setInt(5, list.getSize());
            stm.setString(6, list.getAccount().getUsername());
            stm.setInt(7, list.getProduct().getPid());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public WishList checkProductExistInWishlist(String username,int pid){
        try {
            String sql ="Select * from WishList where username_id = ? and productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
               WishList wl = new WishList();
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
                return wl;
            }
        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<WishList> getWishList(String username){
        ArrayList<WishList> list = new ArrayList<>();
        try {
            String sql = "Select * from WishList where username_id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                WishList wl = new WishList();
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
    public void deleteWishList(String username, int pid){
        try {
            String sql = "DELETE FROM WishList where username_id = ? and productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setInt(2, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WishListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
