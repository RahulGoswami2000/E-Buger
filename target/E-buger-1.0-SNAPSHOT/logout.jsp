<%-- 
    Document   : logout
    Created on : 14 Dec, 2021, 1:46:47 PM
    Author     : ACER
--%>

<%
session.invalidate();
response.sendRedirect("index.html");
%>