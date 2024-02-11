<%-- 
    Document   : landingpage
    Created on : Feb 4, 2024, 4:49:45 PM
    Author     : ngung
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.model.ProductModel"%>
<%@page import="ProductDAO.ProductDAO"%>
<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    request.setAttribute("auth", auth);
    }
    
ProductDAO pd = new ProductDAO(DbCon.getConnection());
List<ProductModel> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agri-Center</title>
        <%@include file = "includes/header.jsp" %>
    </head>
    
    <body>
        <%@include file = "includes/navbar.jsp" %>
        
        <div class="container">
            
            <div class="content ">
        <div class="inner">
        <div class="image-content">
        </div>
        <div class="background"></div>
        <div class="intro">
        <h1>Welcome to </br> Agri-Center</h1>
        <p>
            We are scientists, development professionals,and community members decided <br>
            to scientific innovations that increase global food production protect the <br>
            Environment, we have to work in different countries to improve food security.
        </p>
        <button>Discover More</button>
      </div>
    </div>
      </div>
      
          
      
            
        </div>
        <%@include file = "includes/footer2.jsp" %>
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>
