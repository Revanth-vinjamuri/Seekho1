<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>

<%
try{
	String pass = request.getParameter("pass");
	String rpass = request.getParameter("rpass");
	if(pass.equals(rpass)){
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:Mysql://127.0.0.1:3306/hp", "root", "root");
		
		PreparedStatement ps = conn.prepareStatement("insert into userd values(?,?,?,?,?,?)");
		ps.setString(1,request.getParameter("uname"));
		ps.setString(2,request.getParameter("mobile"));
		ps.setString(3,request.getParameter("email"));
		ps.setString(4,request.getParameter("pass"));
		ps.setString(5,request.getParameter("inst"));
		ps.setString(6,request.getParameter("cname"));
		int x=0;
		x = ps.executeUpdate();
		
		if(x==0){
			out.print("<center><h2>Registration Failed :(</h2></center>");
		}else{
			out.print("<center><h2>Registration Successfull :)</h2></center>");
			out.print("<a class='button' href='http://localhost:8080/E-learning/Login.html'>Login</a> ");
		}
	}
	else{
		out.print("*** Password and Re-type Password must be same. ***");
	}
}
catch(Exception e){
	out.print("<center><h2>Insertion Failed :(</h2></center>");
}
%>
</body>
</html>