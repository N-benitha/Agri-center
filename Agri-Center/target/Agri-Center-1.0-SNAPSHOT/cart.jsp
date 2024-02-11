<%-- 
    Document   : cart
    Created on : Jan 30, 2024, 3:30:44 PM
    Author     : ngung
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="ProductDAO.ProductDAO"%>
<%@page import="com.model.Cart"%>
<%@page import="java.util.*"%>
<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDAO pctDAO = new ProductDAO(DbCon.getConnection());
        cartProduct = pctDAO.getCartProducts(cart_list);
        double total = pctDAO.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shop with Us</title>
        <%@include file = "includes/header.jsp" %>
        
        <style type="text/css">
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 20px;
            }
        </style>
        
    </head>
    <body>
        <%@include file = "includes/navbar.jsp" %>

        <div class="container">
            <div class="d-flex py-3">
                <h3>Total price: $ ${(total > 0)? dcf.format(total): 0.0}</h3>
                <a class="mx-3 btn btn-primary" href="check-out">Check-out</a>
            </div>
            
                <!--table to hold cart items-->
                <table class="table table-success">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Price</th>
                            <th scope="col">Buy Now</th>
                            <th scope="col">Cancel</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <%
                            if (cart_list != null) {
                                for (Cart c:cartProduct) { %>
                                    <tr>
                                        <td><%= c.getName()%></td>
                                        <td><%= c.getCategory()%></td>
                                        <td><%= dcf.format(c.getPrice())%>$</td>
                                        <td>
                                            <form action= "buy-now" method="post" class="form-inline">
                                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                    
                                    <!--increment and decrement button-->
                                                <div class="form-group d-flex justify-content-between">
                                                    <a class="btn btn-sm btn-decre" href="quantity-inc-and-dec?action=dec&id=<%= c.getId() %>"><i class="fas fa-minus-square"></i></a>                                        
                                        
                                                    <input type="text" name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly>
                                                    <a class="btn btn-sm btn-incre" href="quantity-inc-and-dec?action=inc&id=<%= c.getId() %>"><i class="fa-solid fa-square-plus"></i></a>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-small">Buy</button>
                                            </form>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm btn-danger" href="delete-from-cart?id=<%= c.getId() %>">Remove</a>
                                        </td>
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
