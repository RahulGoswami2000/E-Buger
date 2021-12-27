<%-- 
    Document   : userrejectedbuglist
    Created on : 11 Dec, 2021, 11:16:59 PM
    Author     : ACER
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://e-buger.c9oknbwbmj72.ap-south-1.rds.amazonaws.com:3306/";
String database = "e-buger";
String userid = "admin";
String password = "123456789";
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
<link rel="stylesheet" src="text/css" href="userlanding.css"/>
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
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
    <a href="bug_form.html">Bug Form</a>
    <a href="useracceptedbugs.jsp">Accepted Bug</a>
    <a href="userrejectedbuglist.jsp">Rejected Bug</a>
  </div>
</div>
<div class="h2">
<span style="font-size:30px;color: #EFEEF5; cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
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
String name=(String)session.getAttribute("uname1");
System.out.println(name);
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from rejectedbug where userid='"+name+"'";
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
<script>
function openNav() {
  document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
  document.getElementById("myNav").style.height = "0%";
}
</script>
</div>
</body>
</html>