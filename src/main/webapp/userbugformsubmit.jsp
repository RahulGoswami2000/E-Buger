<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
            try{
                String userid=request.getParameter("userid");
		String firstname=request.getParameter("fname");
		String lastname=request.getParameter("lname");
		String email=request.getParameter("Email");
                String company=request.getParameter("webname");
                String url=request.getParameter("url");
                String descrip=request.getParameter("descrip");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
		Statement st=con.createStatement();
                int i=st.executeUpdate("insert into userbug(userid,firstname,lastname,email,company,url,description)values('"+userid+"','"+firstname+"','"+lastname+"','"+email+"','"+company+"','"+url+"','"+descrip+"')");
                int j=st.executeUpdate("insert into totalbug(userid,firstname,lastname,email,company,url,description)values('"+userid+"','"+firstname+"','"+lastname+"','"+email+"','"+company+"','"+url+"','"+descrip+"')");
                ServletContext sc = getServletContext();
		sc.getRequestDispatcher("/userlanding.html").forward(request,response);
                System.out.println("Data is successfully inserted!");
                }
                catch(Exception e)
                {
                System.out.print(e);
                e.printStackTrace();
                }
	%>
</body>
</html>
