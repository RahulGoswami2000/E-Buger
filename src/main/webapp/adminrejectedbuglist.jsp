<%-- 
    Document   : adminrejectedbuglist
    Created on : 28 Nov, 2021, 10:33:12 PM
    Author     : ACER
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "e-buger";
String userid = "root";
String password = "$712000Rahul";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" src="text/css" href="buglist.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<style>
body
{
font-family: 'Josefin Sans', sans-serif;
}
table {
  font-family: century gothic;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  text-align:center;
}

tr:nth-child(even) {
/*  background-image: linear-gradient(to right,lightblue,black);*/
  background-color: black;
  color: white;
  font-weight:900;
}
tr:nth-child(odd) {
/*  background-image: linear-gradient(to right,black,lightblue);*/
  background-color: lightblue;
  color: white;
  font-weight:900;
  }
	 .button
		 {
			 font-family: century gothic;
			 border: none;
			 color: white;
			 padding: 5px 10px;
			 text-align: center;
			 text-decoration: none;
			 display: inline-block;
			 font-size: 16px;
			 margin: 10px 2px;
			 cursor: pointer;
			 border-radius: 10px;
			 background-color: #32cd32;
                         font-weight: bold;
		 }
		 .button1
		 {
			 font-family: century gothic;
			 border: none;
			 color: white;
			 padding: 5px 10px;
			 text-align: center;
			 text-decoration: none;
			 display: inline-block;
			 font-size: 16px;
			 margin: 10px 2px;
			 cursor: pointer;
			 border-radius: 10px;
			 background-color: red;
                         font-weight: bold;
		 }
</style>
</head>
<body>
<body>
<div class="container-fluid">
<!-- Background animtion-->
    <div class="background">
       <div class="cube"></div>
       <div class="cube"></div>
       <div class="cube"></div>
       <div class="cube"></div>
      <div class="cube"></div>
    </div>
<!-- header -->
   <header>
<!-- navbar -->
     <nav>
        <ul>
<!--           <li><a href="signup_land.html">Sign Up</a></li>-->
            <li><a href="logout.jsp">Logout</a></li>
         </ul>
       </nav>
<!-- logo -->
<div class="logo"><span><a href="index.html">E-Buger</a></span></div>
<!-- title & content -->
      <section class="header-content">
        
      </section>
  </header>
<div class="table">
<h1><center>Rejected Bugs</center></h1>
<table border="1">
<tr>
<td>UserID</td>
<td>Firstname</td>
<td>Lastname</td>
<td>Email</td>
<td>Company</td>
<td>URL</td>
<td>Description</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from rejectedbug";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("userid") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("company") %></td>
<td><%=resultSet.getString("url") %></td>
<td><%=resultSet.getString("description") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>
