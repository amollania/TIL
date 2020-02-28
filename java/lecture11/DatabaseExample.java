package lecture11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseExample {
	public static void main(String[] args) throws Exception {
		// 1. JDBC 드라이버 등록
		// 1-1. Class.forName("")을 이용하여 드라이버 등록
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 1-2. DriverManager.deregisterDriver()을 통해 드라이버 등록
		// DriverManager.deregisterDriver(new OracleDriver());
		
		// 2. DBMS 접속 정보를 통해 DB 연결
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		System.out.println("Complate");
		
		// 3. DBMS 쿼리 작성
		Statement statement = connection.createStatement();
		
		// 4. 쿼리 전송
		ResultSet resultSet = statement.executeQuery("select mem_id, mem_name, mem_hp from member");
		// executeQuery : select문
		// executeUpdate : insert, update, delate문
		
		// 5. 결과 확인
		while (resultSet.next()) {
			System.out.println(resultSet.getString(1) + " : " + resultSet.getString(2) + " : " + resultSet.getString(3));
		}
		
		// 6. 자원 반납
		resultSet.close();
		statement.close();
		connection.close();
	}
}
