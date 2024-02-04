<%-- 
    Document   : orders
    Created on : Jan 30, 2024, 3:31:14 PM
    Author     : ngung
--%>

<%@page import="com.User.User"%>
<%@page import="com.connect.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
    request.setAttribute("auth", auth);
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

        
        
        
        
        <%@include file = "includes/footer.jsp" %>
    </body>
    
</html>