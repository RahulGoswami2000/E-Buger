<%-- 
    Document   : adminacceptbug
    Created on : 28 Nov, 2021, 10:18:00 PM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
//String Name_of_organization=request.getParameter("nog");
String userid=request.getParameter("userid");
//String Comment=request.getParameter("cmnt");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
String sql="insert into adminacceptbug select * from acceptbug where userid=? ";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,userid);
int rs=ps.executeUpdate();
String sql1="delete from acceptbug where userid=? ";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,userid);
int rs1=ps1.executeUpdate();
ServletContext sc = getServletContext();
sc.getRequestDispatcher("/adminlanding.html").forward(request,response);
System.out.println("Data is successfully Accepted!");
%>