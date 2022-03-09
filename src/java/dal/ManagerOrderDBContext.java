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
import model.Order;
import model.OrderDetail;
import model.Shipping;

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
    public void deleteOrderDetail(int id){
        try {
            String sql = "DELETE FROM OrderDetail where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Order> getOrders(){
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Order o = new Order();
                o.setId(rs.getInt(1));
                o.setUsername(rs.getString(2));
                o.setTotalPrice(rs.getInt(3));
                o.setNote(rs.getString(4));
                o.setCreatedDate(rs.getDate(5));
                o.setShippingId(rs.getInt(6));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    public void deleteOrder(int id){
        try {
            String sql = "DELETE FROM Orders where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Shipping> getShipping(){
        ArrayList<Shipping> shippings = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Shipping";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Shipping s = new Shipping();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setPhone(rs.getString(3));
                s.setAddress(rs.getString(4));
                shippings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return shippings;
    }
    public void deleteShipping(int id){
        try {
            String sql = "DELETE FROM Shipping where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagerOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
