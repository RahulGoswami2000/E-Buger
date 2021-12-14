<%-- 
    Document   : acceptbug
    Created on : 9 Nov, 2021, 1:40:47 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
//String Name_of_organization=request.getParameter("nog");
String userid=request.getParameter("userid");
//String Comment=request.getParameter("cmnt");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
String sql="insert into acceptbug select * from totalbug where userid=? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,userid);
int rs=ps.executeUpdate();
String sql1="delete from totalbug where userid=? ";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,userid);
int rs1=ps1.executeUpdate();
ServletContext sc = getServletContext();
sc.getRequestDispatcher("/stafflanding.html").forward(request,response);
System.out.println("Data is successfully Accepted!");
%>