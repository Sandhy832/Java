<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.lang.ClassNotFoundException" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpServletResponse" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
String url="jdbc:oracle:thin:@//localhost:1521/XE";
String u="SANDY";
String p="sandy";
Connection con=null;
PreparedStatement st=null;
ResultSet rs=null;
%>
<%!
public void jspInit()
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Loaded");
		con=DriverManager.getConnection(url, u, p);
		System.out.println("Connected");
	}
	catch (Exception e) 
	{
		e.printStackTrace();
		System.out.println("Problem Occurred");
	}
}
%>
<%!
public void jspDestroy()
{
	try
	{
	con.close();
	st.close();
	rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Problem Occurred");
	}
}
%>
<%
try {
	String s="SELECT * FROM VTURESULT WHERE MARKS1=?";
	String t=request.getParameter("usn");
	st=con.prepareStatement(s);
	st.setString(1, t);
	rs=st.executeQuery();
	while(rs.next()==true)
	{
	String a=rs.getString(1);
	String b=rs.getString(2);
	int c=rs.getInt(3);
	int d=rs.getInt(4);
	int e=rs.getInt(5);
	out.println(a);
	out.println(b);
	out.println(c);
	out.println(d);
	out.println(e);
	}
} 
catch (Exception e) 
{
	e.printStackTrace();
	System.out.println("Problem");
}
%>
</body>
</html>