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
import model.Product;


/**
 *
 * @author DELL
 */
public class ProductDBContext extends DBContext {
    public ArrayList<Product> getProducts(int pageindex, int pagesize){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM\n" +
                        "(SELECT *, ROW_NUMBER() OVER (ORDER BY pid ASC) as row_index FROM Product) tb\n" +
                        "WHERE row_index >=(?-1)* ? +1 AND row_index <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getInt(5));
            pr.setPcolor(rs.getString(6));
            pr.setSize(rs.getInt(7));
            pr.setQuantity(rs.getInt(8));
            Category c = new Category();
            c.setCid(rs.getInt(9));
            pr.setCate(c);
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getNewProducts(){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "Select top 4* from Product order by pid desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
        while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getInt(5));
            pr.setPcolor(rs.getString(6));
            pr.setSize(rs.getInt(7));
            pr.setQuantity(rs.getInt(8));
            Category c = new Category();
            c.setCid(rs.getInt(9));
            pr.setCate(c);
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getProductByCategory(int cid){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "Select p.pid,p.pname,p.pdescription,p.pimage,p.price,p.pcolor,p.size,p.pquantity from Product p INNER JOIN Category c ON p.cid = c.cid WHERE c.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
        while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt("pid"));
            pr.setPname(rs.getString("pname"));
            pr.setPdescription(rs.getString("pdescription"));
            pr.setPimage(rs.getString("pimage"));
            pr.setPrice(rs.getInt("price"));
            pr.setPcolor(rs.getString("pcolor"));
            pr.setSize(rs.getInt("size"));
            pr.setQuantity(rs.getInt("pquantity"));
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public Product getProductByID(int id){
        
        try {
            String sql = "Select * from Product WHERE pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
        if(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getInt(5));
            pr.setPcolor(rs.getString(6));
            pr.setSize(rs.getInt(7));
            pr.setQuantity(rs.getInt(8));
            Category c = new Category();
            c.setCid(rs.getInt(9));
            pr.setCate(c);
            return pr;
            
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<Product> SearchProductByName(String searchName){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "Select * from Product where pname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+searchName+"%");
            ResultSet rs = stm.executeQuery();
        while(rs.next()){
            Product pr = new Product();
            pr.setPid(rs.getInt(1));
            pr.setPname(rs.getString(2));
            pr.setPdescription(rs.getString(3));
            pr.setPimage(rs.getString(4));
            pr.setPrice(rs.getInt(5));
            pr.setPcolor(rs.getString(6));
            pr.setQuantity(rs.getInt(9));
            Category c = new Category();
            c.setCid(rs.getInt(9));
            pr.setCate(c);
            
            products.add(pr);
        }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public int count()
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product";
            PreparedStatement stm = connection.prepareStatement(sql);
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
    public int countProductByCategory(int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
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
    public int countProductBySearchName(String searchName)
    {
        try {
            String sql = "Select COUNT(*) as Total  from Product where pname like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+searchName+"%");
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
    public void DeleteProduct(int pid){
        try {
            String sql = "DELETE  from Product where pid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void InsertProduct(Product p ){
        try {
            String sql = "INSERT INTO [dbo].[Product]\n" +
                    "           ([pid]\n" +
                    "           ,[pname]\n" +
                    "           ,[pdescription]\n" +
                    "           ,[pimage]\n" +
                    "           ,[price]\n" +
                    "           ,[pcolor]\n" +
                    "           ,[size]\n" +
                    "           ,[pquantity]\n" +
                    "           ,[cid])\n" +
                    "     VALUES\n" +
                    "           (?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, p.getPid());
            stm.setString(2, p.getPname());
            stm.setString(3, p.getPdescription());
            stm.setString(4, p.getPimage());
            stm.setInt(5, p.getPrice());
            stm.setString(6, p.getPcolor());
            stm.setInt(7, p.getSize());
            stm.setInt(8, p.getQuantity());
            stm.setInt(9, p.getCate().getCid());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                
    }

    public void UpdateProduct(Product p) {
        try {
            String sql = "UPDATE [dbo].[Product]\n" +
                    "   SET "+
                    "      [pname] = ?\n" +
                    "      ,[pdescription] = ?\n" +
                    "      ,[pimage] = ?\n" +
                    "      ,[price] = ?\n" +
                    "      ,[pcolor] = ?\n" +
                    "      ,[size] = ?\n" +
                    "      ,[pquantity] = ?\n" +
                    "      ,[cid] = ?\n" +
                    " WHERE [pid] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getPname());
            stm.setString(2, p.getPdescription());
            stm.setString(3, p.getPimage());
            stm.setInt(4, p.getPrice());
            stm.setString(5, p.getPcolor());
            stm.setInt(6, p.getSize());
            stm.setInt(7, p.getQuantity());
            stm.setInt(8, p.getCate().getCid());
            stm.setInt(9, p.getPid());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Product> SearchProductByPrice(String price){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product where price >=? and price <= 20000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public int countProductByPrice(String price)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 20000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
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
    public ArrayList<Product> SearchProductByPrice1(String price){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product where price >=? and price <= 30000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public int countProductByPrice1(String price)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 30000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
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
    public ArrayList<Product> SearchProductByPrice2(String price){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product where price >=? and price <= 40000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public int countProductByPrice2(String price)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 40000";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
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
    public ArrayList<Product> SearchProductByPrice3(String price){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product where price > ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public int countProductByPrice3(String price)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price > ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
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
    public ArrayList<Product> SortAsc(int pageindex, int pagesize){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (order by price asc) as row_index FROM Product) tb\n" +
                         "WHERE row_index >=(?-1)* ? +1 AND row_index <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public ArrayList<Product> SortDesc(int pageindex, int pagesize){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (order by price desc) as row_index FROM Product) tb\n" +
"                        WHERE row_index >=(?-1)* ? +1 AND row_index <= ? * ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product pr = new Product();
                pr.setPid(rs.getInt(1));
                pr.setPname(rs.getString(2));
                pr.setPdescription(rs.getString(3));
                pr.setPimage(rs.getString(4));
                pr.setPrice(rs.getInt(5));
                pr.setPcolor(rs.getString(6));
                pr.setSize(rs.getInt(7));
                pr.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                pr.setCate(c);
                product.add(pr);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public ArrayList<Product> SearchProductByPriceOfCategory(String price,int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where price >=? and price<=20000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
      public int countProductByPriceOfCategory(String price,int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 20000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
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
     public ArrayList<Product> SearchProductByPriceOfCategory1(String price,int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where price >=? and price<=30000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
      public int countProductByPriceOfCategory1(String price,int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 30000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
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
    public ArrayList<Product> SearchProductByPriceOfCategory2(String price,int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where price >=? and price<=40000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
     public int countProductByPriceOfCategory2(String price,int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price >= ? AND price <= 40000 and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
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
    public ArrayList<Product> SearchProductByPriceOfCategory3(String price,int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where price > ? and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
     public int countProductByPriceOfCategory3(String price,int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where price > ? and cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, price);
            stm.setInt(2, cid);
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
    public ArrayList<Product> SortAscPriceOfCategory(int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "Select * from Product where cid = ? order by price asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public ArrayList<Product> SortDescPriceOfCategory(int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "Select * from Product where cid = ? order by price desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public ArrayList<Product> ColorProduct(String color){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where pcolor like ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+color+"%");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
    public int countProductByColor(String color)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where pcolor like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
             stm.setString(1, "%"+color+"%");
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
     public ArrayList<Product> ColorProductByCategory(String color,int cid){
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "select * from Product where cid = ? and pcolor like ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setString(2, "%"+color+"%");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setPid(rs.getInt(1));
                p.setPname(rs.getString(2));
                p.setPdescription(rs.getString(3));
                p.setPimage(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setPcolor(rs.getString(6));
                p.setSize(rs.getInt(7));
                p.setQuantity(rs.getInt(8));
                Category c = new Category();
                c.setCid(rs.getInt(9));
                p.setCate(c);
                product.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
     public int countProductByColorOfCategory(String color,int cid)
    {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Product where cid = ? and pcolor like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setString(2, "%"+color+"%");
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

