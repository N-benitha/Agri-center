<%-- 
    Document   : index
    Created on : Jan 30, 2024, 3:36:05 PM
    Author     : ngung
--%>

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
            <div class="card-header my-3">All products</div>
            
            <div class="row">
                
<!--                Products and their descriptions-->
                <%
                   if (!products.isEmpty()){
                        for (ProductModel p:products) { %>
                            <div class="col-md-3 my-3">                    
                                <div class="card w-100" style="width: 18rem;">
                                    <img class="card-img-top" src="images/<%= p.getImage() %>" alt="food image">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getName() %></h5>
                                        <h6 class="price">Price: $<%= p.getPrice() %></h6>
                                        <h6 class="category">Category: <%= p.getCategory() %></h6>
                            
                                        <div class="mt-3 d-flex justify-content-between">
                                            <a href="cart-operations?id=<%= p.getId()%>" class="btn btn-dark">Add to Cart</a>
                                            <a href="cart-operations" class="btn btn-primary">Buy Now</a>
                                        </div>
                            
                                    </div>
                                </div>                   
                            </div>
                        <%}
                    } 
                %>
                
                
            </div>
        </div>
        
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>
