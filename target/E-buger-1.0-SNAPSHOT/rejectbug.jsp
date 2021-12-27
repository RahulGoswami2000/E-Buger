<%-- 
    Document   : rejectbug
    Created on : 9 Nov, 2021, 11:31:49 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String userid=request.getParameter("userid");
//String Email=request.getParameter("email");
//String Comment=request.getParameter("cmnt");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://e-buger.c9oknbwbmj72.ap-south-1.rds.amazonaws.com:3306/e-buger","admin","123456789");
String sql="insert into rejectedbug select * from totalbug where userid=? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,userid);
int rs=ps.executeUpdate();
String sql1="delete from totalbug where userid=? ";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,userid);
int rs1=ps1.executeUpdate();
ServletContext sc = getServletContext();
sc.getRequestDispatcher("/stafflanding.html").forward(request,response);
System.out.println("Order Rejected");
%>
