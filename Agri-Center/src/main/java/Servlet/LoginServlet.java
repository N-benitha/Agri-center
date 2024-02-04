/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import UserDAO.UserDAO;
import com.User.User;
import com.connect.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ngung
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
//            out.print("this is login servlet");

            String email = req.getParameter("login-email");
            String password = req.getParameter("login-password");
            
            UserDAO udao = new UserDAO(DbCon.getConnection());
            User user = udao.userLogin(email, password);
            
            if (user != null) {
                req.getSession().setAttribute("auth", user);
                resp.sendRedirect("index.jsp");
            } else {
                out.print("user login failed");
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
