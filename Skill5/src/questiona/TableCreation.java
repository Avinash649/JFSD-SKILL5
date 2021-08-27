package questiona;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TableCreation {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jfsd","jfsd123");
			Statement st = con.createStatement();
			String sql = "CREATE TABLE books(bookname varchar(155), author varchar(155),description varchar(500),"
					+ "price number(10),URL varchar(500))";
			st.execute(sql);
			
			System.out.println("Tables Created");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
}
}
