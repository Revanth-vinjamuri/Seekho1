@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>

<%

String uname = request.getParameter("uname");
String pass = request.getParameter("pass");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:Mysql://127.0.0.1:3306/hp", "root", "root");
	
	PreparedStatement ps = conn.prepareStatement("select pass from userd where uname='"+uname+"';");
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	if(pass.equals(rs.getString("pass"))){
		out.print("<table><tr>");
		out.print("<a href='http://localhost:8080/E-learning/menu.html'></a>");

		
		out.print("</tr></table>");
	}
	else{
		out.print("<center><h2>Login Failed</h2></center>");
		//out.print("New User? <a href='userRegi.html'>Register now</a>");
	}
}
catch(Exception e){
	out.print("<center><h2>Login Failed</h2></center>");
}
%>

</body>
</html>