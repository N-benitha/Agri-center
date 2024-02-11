/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package OrderDAO;

import ProductDAO.ProductDAO;
import com.model.Orders;
import com.model.ProductModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author ngung
 */
public class OrderDAO {

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public PreparedStatement getPst() {
        return pst;
    }

    public void setPst(PreparedStatement pst) {
        this.pst = pst;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    public OrderDAO(Connection con) {
        this.con = con;
    }
    
    public boolean insertOrder(Orders model) {
        boolean result = false;
        
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values (?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUserid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            
            result = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }
    
    public List<Orders> userOrders(int id) {
        List<Orders> list = new ArrayList<>();
        
        try {
            
            query = "select * from orders where u_id=? order by orders.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Orders order = new Orders();
                ProductDAO pctDao = new ProductDAO(this.con);
                int pid = rs.getInt("p_id");
                
                ProductModel product = pctDao.getSingleProduct(pid);
                order.setOrderId(rs.getInt("o_id"));
                order.setId(pid);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("o_quantity"));
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    public void cancelOrder(int id) {
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
}
