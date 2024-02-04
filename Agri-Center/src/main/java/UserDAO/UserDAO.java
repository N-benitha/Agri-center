/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package UserDAO;

import com.User.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ngung
 */
public class UserDAO {
    private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDAO(Connection con) {
        this.con = con;
    }
    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email = ? and password = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }
    
}
