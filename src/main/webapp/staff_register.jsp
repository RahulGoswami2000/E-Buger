<%-- 
    Document   : staff_register
    Created on : 9 Sep, 2021, 8:54:51 AM
    Author     : ACER
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
</head>
<body>
<%
String Firstname=request.getParameter("fname");
String Lastname=request.getParameter("lname");
String Phone=request.getParameter("Phone");
String Email=request.getParameter("Email");
String Username=request.getParameter("uname");
String Password=request.getParameter("Pswd");
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
		String sql1 = "select * from staff where staffid = ?";
                PreparedStatement ps1 = con.prepareStatement(sql1);
		ps1.setString(1, Username);
		ResultSet rs = ps1.executeQuery();
		if(rs.next())
		{
			JFrame parent = new JFrame();	 
			JOptionPane.showMessageDialog(parent, "Staff ID already exist. Use different Staff ID.");
			System.out.println("Staff ID already exist. Use different Staff ID.");
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/staff_signup.html").forward(request,response);
			
		}
		else
		{
			String sql = "insert into staff (firstname,lastname,phone,email,staffid,password)values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, Firstname);
			ps.setString(2, Lastname);
			ps.setString(3, Phone);
			ps.setString(4, Email);
			ps.setString(5, Username);
			ps.setString(6, Password);
			ps.executeUpdate();
                        int i=ps.executeUpdate();
			if (i > 0) {
	            System.out.println("User Registered!!!!"); 
                    ServletContext sc = getServletContext();
                    sc.getRequestDispatcher("/stafflanding.html").forward(request,response);
	        } else {
	            System.out.println("Data not accepted");
	        }
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/index.html").forward(request,response);     
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>

</body>
</html>


