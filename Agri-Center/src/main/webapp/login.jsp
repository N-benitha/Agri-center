<%-- 
    Document   : login
    Created on : Jan 30, 2024, 3:30:31 PM
    Author     : ngung
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Cart"%>
<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign In</title>
        <%@include file = "includes/header.jsp" %>
    </head>
    <body>
        <%@include file = "includes/navbar.jsp" %>
        <div class="container">
            <div class="w-50 mx-auto my-5">
                
                <!-- Login form -->
                <div class= "card-header text-center">User Login</div>

                <div class="card-body">

                    <form action="user-login" method="post">

                        <!-- email and password input fields -->

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="login-email" placeholder="Enter Your Email" required>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="login-password" placeholder="*******" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                        <div class="text-center">
                            <p>You don't have an account? <a href="#">Sign in </a>Here</p>
                        </div>

                    </form>
                </div>

            </div>

        </div>

        <%@include file = "includes/footer2.jsp" %>
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>
