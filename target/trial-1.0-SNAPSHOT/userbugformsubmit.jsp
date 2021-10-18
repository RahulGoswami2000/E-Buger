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
		String firstname=request.getParameter("fname");
		String lastname=request.getParameter("lname");
		String email=request.getParameter("Email");
                String company=request.getParameter("webname");
                String url=request.getParameter("url");
                String descrip=request.getParameter("descrip");
                String image=request.getParameter("img");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
		Statement st=con.createStatement();
                int i=st.executeUpdate("insert into userbug(firstname,lastname,email,company,url,description,image)values('"+firstname+"','"+lastname+"','"+email+"','"+company+"','"+url+"','"+descrip+"','"+image+"')");
                ServletContext sc = getServletContext();
		sc.getRequestDispatcher("/index.html").forward(request,response);
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
