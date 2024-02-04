<%-- 
    Document   : cart
    Created on : Jan 30, 2024, 3:30:44 PM
    Author     : ngung
--%>

<%@page import="ProductDAO.ProductDAO"%>
<%@page import="com.model.Cart"%>
<%@page import="java.util.*"%>
<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDAO pctDAO = new ProductDAO(DbCon.getConnection());
        pctDAO.getCartProducts(cart_list);
        request.setAttribute("cart_list", cart_list);
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
                <h3>Total price: $ 444</h3>
                <a class="mx-3 btn btn-primary" href="#">Check-out</a>
            </div>
            
                <!--table to hold cart items-->
                <table class="table table-light">
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
                        <tr>
                            <td>Sugar</td>
                            <td>Carbohydrates</td>
                            <td>120$</td>
                            <td>
                                <form action= "" method="post" class="form-inline">
                                    <input type="hidden" name="id" value="1" class="form-input">
                                    
                                    <!--increment and decrement button-->
                                    <div class="form-group d-flex justify-content-between">
                                        <a class="btn btn-sm btn-decre" href=""><i class="fas fa-minus-square"></i></a>                                        
                                        
                                        <input type="text" name="quantity" class="form-control" value="1" readonly>
                                        <a class="btn btn-sm btn-incre" href=""><i class="fa-solid fa-square-plus"></i></a>
                                    </div>
                                </form>
                            </td>
                            <td>
                                <a class="btn btn-sm btn-danger" href="">Remove</a>
                            </td>
                        </tr>
                    </tbody>
                </table>               
            
        </div>
        
        
        
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>
