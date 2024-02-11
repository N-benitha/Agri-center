<%-- 
    Document   : orders
    Created on : Jan 30, 2024, 3:31:14 PM
    Author     : ngung
--%>

<%@page import="com.model.Orders"%>
<%@page import="OrderDAO.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.model.Cart"%>
<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Orders> orders = null;
    if (auth != null) {
    request.setAttribute("auth", auth);
    orders = new OrderDAO(DbCon.getConnection()).userOrders(auth.getId());
    } else {
//    response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Orders Page</title>
        <%@include file = "includes/header.jsp" %>
    </head>
    <body>
        <%@include file = "includes/navbar.jsp" %>

        <div class="container">
            <div class="card-header my-3">All Orders</div>
            
                <!--table to hold ordered items items-->
                <table class="table table-light">
                    <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Cancel</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        
                        <%
                            if(orders != null) {
                                for (Orders o:orders) {%>
                                <tr>
                                    <td><%= o.getDate() %></td>
                                    <td><%= o.getName() %></td>
                                    <td><%= o.getCategory() %></td>
                                    <td><%= o.getQuantity() %></td>
                                    <td><%= dcf.format(o.getPrice()) %></td>                                    
                                    <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%= o.getOrderId() %>">Cancel</a></td>
                                </tr>
                                <%}
                            }
                        %>
                        
                    </tbody>
                </table>               
            
        </div>
        
        
        <%--<%@include file = "includes/footer2.jsp" %>--%>
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>