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

/**
 *
 * @author Admin
 */
public class AccountDBContext extends DBContext{
    public Account getAccoun(String username, String password)
    {
        try {
            String sql = "SELECT username,password,displayName,address,email,phone,gid FROM Account WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2, password);
            
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setDisplayname(rs.getString("displayName"));
                account.setAddress(rs.getString("address"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                account.setGid(rs.getInt("gid"));
                return account;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public int checkRole(String username, String url)
    {
        try {
            String sql = "Select COUNT(*) AS TOTAL From Account a INNER JOIN Group_Feature gf ON a.gid = gf.gid INNER JOIN Feature f ON gf.fid = f.fid\n" +
                        "where a.username = ? and f.url = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2, url);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                return rs.getInt("Total");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
   
    
    public Account checkAccountExist(String username)
    {
        try {
            String sql = "SELECT username,password,displayName,address,email,phone FROM Account WHERE username = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setDisplayname(rs.getString("displayName"));
                account.setAddress(rs.getString("address"));
                account.setEmail(rs.getString("email"));
                account.setPhone(rs.getString("phone"));
                return account;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void SignUp(String username, String password ,String displayname,String address, String email, String phone){
        try {
            String sql = "INSERT INTO [dbo].[Account]\n" +
                    "           ([username]\n" +
                    "           ,[password]\n" +
                    "           ,[displayName]\n" +
                    "           ,[address]\n" +
                    "           ,[email]\n" +
                    "           ,[phone]\n" +
                    "           ,[gid])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,2)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,username);
            stm.setString(2, password);
            stm.setString(3, displayname);
            stm.setString(4, address);
            stm.setString(5, email);
            stm.setString(6, phone);
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
