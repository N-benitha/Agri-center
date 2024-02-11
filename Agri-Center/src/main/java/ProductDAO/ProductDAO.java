/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ProductDAO;

import com.model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import com.model.ProductModel;
import java.sql.SQLException;

/**
 *
 * @author ngung
 */
public class ProductDAO {

    public ProductDAO(Connection con) {
        this.con = con;
    }
    
    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        try {
            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()) {
                ProductModel row = new ProductModel();
                
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                
                products.add(row);
            }
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        
        return products;
    }
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<>();
        
        try {
            if (cartList.size() > 0) {
                for(Cart item:cartList) {
                    query = "select * from products where id=?";
                    pst = con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    while(rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return products;
    }
    
    public ProductModel getSingleProduct(int id) {
        ProductModel row = null;
        
        try {
            query  = "select * from products where id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                row = new ProductModel();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        
        try{
            if (cartList.size() > 0){
                for (Cart item:cartList) {
                    query = "Select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    while (rs.next()) {
                        sum += rs.getDouble("price")*item.getQuantity();
                    }
                }
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
    
    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
}
