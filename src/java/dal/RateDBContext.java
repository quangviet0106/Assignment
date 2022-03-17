/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Rate;

/**
 *
 * @author Admin
 */
public class RateDBContext extends DBContext{
    public void insertRate(Rate r){
        try {
            String sql="INSERT INTO [Rate]\n" +
                    "           ([rate1]\n" +
                    "           ,[rate2]\n" +
                    "           ,[rate3]\n" +
                    "           ,[rate4]\n" +
                    "           ,[rate5]\n" +
                    "           ,[username]\n" +
                    "           ,[productid])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getRate1());
            stm.setInt(2, r.getRate2());
            stm.setInt(3, r.getRate3());
            stm.setInt(4, r.getRate4());
            stm.setInt(5, r.getRate5());
            stm.setString(6, r.getAccount().getUsername());
            stm.setInt(7, r.getProduct().getPid());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(RateDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int sumRate5(int pid)
    {
        try {
            String sql = "SELECT SUM(rate5) as Total FROM Rate where productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public int sumRate4(int pid)
    {
        try {
            String sql = "SELECT SUM(rate4) as Total FROM Rate where productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public int sumRate3(int pid)
    {
        try {
            String sql = "SELECT SUM(rate3) as Total FROM Rate where productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public int sumRate2(int pid)
    {
        try {
            String sql = "SELECT SUM(rate2) as Total FROM Rate where productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
     public int sumRate1(int pid)
    {
        try {
            String sql = "SELECT SUM(rate1) as Total FROM Rate where productid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
