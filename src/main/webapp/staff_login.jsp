<%-- 
    Document   : staff_login
    Created on : 9 Sep, 2021, 9:21:46 AM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username=(String)session.getAttribute("uname");
		String Username=request.getParameter("uname");
		String Password=request.getParameter("Pswd");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://e-buger.c9oknbwbmj72.ap-south-1.rds.amazonaws.com:3306/e-buger","admin","123456789");
		String sql="select staffid,password from staff where staffid=? and password=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,Username);
		ps.setString(2,Password);
		ResultSet rs=ps.executeQuery();
		int c=0;
		while(rs.next()){
			c=c+1;
		}
		if(c==1){
			System.out.println("StaffID and password Match!");
			session.setAttribute("user",Username);
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/stafflanding.html").forward(request,response);
		}
		else{
			JFrame parent = new JFrame(); 
		    JOptionPane.showMessageDialog(parent, "Wrong Credentials!!");
		    ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/index.html").forward(request,response);
		}
	%>
</body>
</html>

