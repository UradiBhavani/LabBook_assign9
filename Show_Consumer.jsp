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
		
		String cname = request.getParameter("consumerName");
		
		
		try{
			DriverManager.registerDriver(new OracleDriver());
			connection = DriverManager.getConnection(url, username, password);
			
			String query = "select * from Consumers where consumer_name=?";
			statement = connection.prepareStatement(query);
			statement.setString(1,cname);
			
			
			ResultSet res = statement.executeQuery();
			out.println("<html><body><center><table frame='box'>");
				
				int flag=0;
				while(res.next()){
						flag=1;
						int id = res.getInt("CONSUMER_NUM");
						String name = res.getString("CONSUMER_NAME");
						String addr = res.getString("ADDRESS");
						out.println("<tr><th>Consumer Number <td>"+id);
						out.println("<tr><th>Consumer Name <td>"+name);
						out.println("<tr><th>Consumer Address <td>"+addr);
						out.println("<a href='Show Bill details.jsp'>Show Bill details</a></tr>");
			}
				if(flag ==0){
					out.println("<h3>Consumer not found</h3>");
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