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

/**
 *
 * @author DELL
 */
public class CategoryDBContext extends DBContext{
    public ArrayList<Category> getCategory(){
        ArrayList<Category> categorys = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setCid(rs.getInt(1));
                c.setCname(rs.getString(2));
                categorys.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }
    public Category getCategoryById(int cid){
        
        try {
            String sql = "SELECT * FROM Category where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setCid(rs.getInt(1));
                c.setCname(rs.getString(2));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void insertCategory(Category c){
        try {
            String sql = "INSERT INTO [dbo].[Category]\n" +
                    "           ([cid]\n" +
                    "           ,[cname])\n" +
                    "     VALUES\n" +
                    "           (?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, c.getCid());
            stm.setString(2, c.getCname());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteCategory(int cid){
        try {
            String sql = "DELETE FROM Category where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void updateCategory(Category c){
        try {
            String sql = "UPDATE [dbo].[Category]\n" +
                    "   SET \n" +
                    "      [cname] = ?\n" +
                    " WHERE [cid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getCname());
            stm.setInt(2, c.getCid());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
