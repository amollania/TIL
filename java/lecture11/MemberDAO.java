package lecture11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class MemberDAO {
	public List<MemberVO> selectList() throws Exception {
		List<MemberVO> list = new ArrayList<MemberVO>();
		DriverManager.deregisterDriver(new OracleDriver());
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select mem_id, mem_name, mem_add1, mem_hp from member");
		while (resultSet.next()) {
			String memId = resultSet.getString("mem_id");
			String memName = resultSet.getString("mem_name");
			String memAdd1 = resultSet.getString("mem_add1");
			String memHp = resultSet.getString("mem_hp");
		list.add(new MemberVO(memId, memName, memAdd1, memHp));
		}
		
		resultSet.close();
		statement.close();
		connection.close();
		return list;
	}
	
	public MemberVO selectOne(String id) throws SQLException {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		Statement statement = connection.createStatement();
		//	ResultSet resultSet = statement.executeQuery("select mem_id, mem_name, mem_add1, mem_hp from member where mem_id = '" + memId + "'");
		PreparedStatement preparedStatement = connection.prepareStatement("select mem_id, mem_name, mem_add1, mem_hp from member where mem_id = ?");
		preparedStatement.setString(1, id);
		ResultSet resultSet = preparedStatement.executeQuery();
		MemberVO memberVO = null;
		if (resultSet.next()) {
			String memId = resultSet.getString("mem_id");
			String memName = resultSet.getString("mem_name");
			String memAdd1 = resultSet.getString("mem_add1");
			String memHp = resultSet.getString("mem_hp");
			memberVO = new MemberVO(memId, memName, memAdd1, memHp);
		}
		return memberVO;
	}
	
	public void insert(MemberVO vo) throws SQLException {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		Statement statement = connection.createStatement();
		statement.executeUpdate("insert into member(mem_id, mem_name, mem_add1, mem_hp) values('a002', 'Hong', 'dae', '010-0242-2123')");
	}
	
	public int update(MemberVO vo) throws Exception {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		String sql = "update member set mem_name = ?, mem_add1 = ? , mem_hp =? where mem_id = ?";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, vo.getMemId());
		preparedStatement.setString(2, vo.getMemName());
		preparedStatement.setString(3, vo.getMemAdd1());
		preparedStatement.setString(4, vo.getMemHp());
		int result = preparedStatement.executeUpdate();
		preparedStatement.close();
		return result;
	}
	
//	public void delate() {	}
	
}
