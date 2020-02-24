<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="oracle.jdbc.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%!
		Connection connection = null;
		PreparedStatement statement = null;
	%>

	<%
		String url = application.getInitParameter("url");
		String username = application.getInitParameter("username");
		String password = application.getInitParameter("password");
		
		
		
		
		try{
			DriverManager.registerDriver(new OracleDriver());
			connection = DriverManager.getConnection(url, username, password);
			
			String query = "select * from Consumers";
			statement = connection.prepareStatement(query);
			
			
			ResultSet res = statement.executeQuery();
			out.println("<html><body><center><table border='1'><tr><th>User Id</th><th>User Name</th><th>Address</th><th>link</th></tr>");
				
				
				while(res.next()){
						int id = res.getInt("CONSUMER_NUM");
						String name = res.getString("CONSUMER_NAME");
						String addr = res.getString("ADDRESS");
				out.println("<tr><td>"+id+"<td>"+name+"<td>"+addr+"<td>"+"<a href='Show Bill details.jsp'>Show Bill details</a></tr>");
			}
			out.println("</table></center>");
			
			out.println("<a href='home.jsp'>Home</a>");
		}catch(SQLException e){
			out.println("Table : " +e.getMessage());
			
		}finally{
			try{
				statement.close();
				connection.close();
			}catch(SQLException ex){
				out.println(ex.getMessage());
			}
		}
	%>

 	

</body>
</html>