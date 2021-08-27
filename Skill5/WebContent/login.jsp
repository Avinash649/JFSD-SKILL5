<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid = request.getParameter("username");    
String pwd = request.getParameter("password");
try {
	session.setAttribute("user",userid);  
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
		"jfsd","jfsd123");
System.out.println("Connected to database");
 Statement st = con.createStatement();
 
 String sql = "select * from user_skill5 where username = ? and password = ?";
 PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1, userid);
    pst.setString(2, pwd);
	ResultSet resultset = pst.executeQuery();
    if(resultset.next()) {
		out.println("<h2>Login Successfull</h2>");
		out.println("<h2>Click <a href='dash.jsp'>here</a></h2>");
    }else {
    	out.println("<h2>Login Failed</h2>");
    	out.println("<h2>Click <a href='reg.jsp'>here</a></h2>");
    }
}catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
    }catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
</body>
</html>