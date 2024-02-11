/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import OrderDAO.OrderDAO;
import com.User.User;
import com.connect.DbCon;
import com.model.Cart;
import com.model.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ngung
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/check-out"})
public class CheckOutServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            
            //getting products from our cart
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            User auth = (User) request.getSession().getAttribute("auth");
            
            if(cart_list != null && auth != null) {
                
                for(Cart c:cart_list) {
                    Orders order = new Orders();
                    order.setId(c.getId());
                    order.setUserid(auth.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));
                    
                    OrderDAO orderDao = new OrderDAO(DbCon.getConnection());
                    boolean result = orderDao.insertOrder(order);
                    if (!result) break;
                }
                cart_list.clear();
                response.sendRedirect("orders.jsp");
                
            } else {
                if (auth == null) {
                    response.sendRedirect("login.jsp");                    
                }
                response.sendRedirect("cart.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
