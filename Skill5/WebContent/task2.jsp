<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOOKS CATALOGUE</title>
<link rel='stylesheet' href='styles.css'>
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
  <div class='home'>
            <h2>Book Details</h2>
               <% while(resultset.next()){ %>
                <section class="section">
                    <img src="<%=resultset.getString(5) %>" class="image" />
                    <div class="content">
                  
                      <h2 class="title">
                        <%= resultset.getString(1) %>
                      </h2>
                      <p class="paragraph">
                        Author : <%= resultset.getString(2) %>
                        <br>
                         <%= resultset.getString(3) %>
                        <br>
                        <div class="con">
                            Price : <%= resultset.getLong(4) %>
                        </div>
                        <br>
                        <br>
                        <a href="AddToCart.jsp?bookname=<%= resultset.getString(1) %>">Add To Cart</a>
                      </p>
                     
                  </section>
               
            </div>
        </div>
        <% } %>
<%
}catch(ClassNotFoundException e) {
	e.printStackTrace();
}catch(SQLException e) {
	e.printStackTrace();
}
%>
</body>
</html>



