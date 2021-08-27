<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOOKS</title>
</head>
<body>
<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jfsd","jfsd123");
	Statement st = con.createStatement();
	String sql = "select * from books";
	ResultSet resultset = st.executeQuery(sql);
%>
  <TABLE BORDER="1">
      <TR>
      <TH>Book Name</TH>
      <TH>Author</TH>
      <TH>Description</TH>
      <TH>Price</TH>
      <TH>URL of Image</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getLong(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
      </TR>
      <% } %>
</TABLE>
<% 
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch(SQLException e) {
	e.printStackTrace();
}
%>
</body>
</html>