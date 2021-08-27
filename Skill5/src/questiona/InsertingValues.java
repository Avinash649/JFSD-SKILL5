package questiona;
import java.sql.*;
import java.util.*;
public class InsertingValues {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter Book name : ");
		String bookname = sc.nextLine();
		System.out.println("Enter Author name  :");
		String author = sc.nextLine();
		System.out.println("Enter description : ");
		String description = sc.nextLine();
		System.out.println("Enter price of book :");
		String price = sc.nextLine();
		System.out.println("Enter URL of image : ");
		String url  =sc.nextLine();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jfsd","jfsd123");
			
			String sql = "insert into books values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			ps.setString(2, author);
			ps.setString(3, description);
			ps.setString(4, price);
			ps.setString(5, url);
			ps.execute();
			System.out.println("Values Inserted !!!");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
}
}
