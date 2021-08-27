<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CART PAGE</title>
<link rel='stylesheet' href='styles.css'>
</head>
<body>
<H2>CART PAGE</H2>
<%
try {
	 String bookname = request.getParameter("bookname"); 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jfsd","jfsd123");
	Statement st = con.createStatement();
	String sql = "select * from books where bookname = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,bookname);
	
	ResultSet resultset = ps.executeQuery();
	
%>
  <TABLE BORDER="1">
      <TR>
      <TH>Book Name</TH>
      <TH>Price</TH>
      <TH>QUANTITY</TH>
      <TH>TOTAL AMOUNT</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getLong(4) %></TD>
       <TD> <input type="number" value="1" min="1"></TD>
       <TD>  </TD>
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





