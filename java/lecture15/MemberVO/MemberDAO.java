package lecture25;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	public List<MemberVO> selectList() throws Exception {
		List<MemberVO> list = new ArrayList<>();
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("select mem_id, mem_name, mem_add1, mem_add2, mem_hp, mem_mileage from member");
		while (resultSet.next()) {
			String memId = resultSet.getString("mem_id");
			String memName = resultSet.getString("mem_name");
			String memAdd1 = resultSet.getString("mem_add1");
			String memAdd2 = resultSet.getString("mem_add2");
			String memHp = resultSet.getString("mem_hp");
			int memMileage = resultSet.getInt("mem_mileage");
			
			list.add(new MemberVO(memId, memName, memAdd1, memAdd2, memHp, memMileage));
		}
		resultSet.close();
		statement.close();
		connection.close();
		return list;
	}
	public MemberVO selectOne(String id) throws Exception {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
//		Statement statement = connection.createStatement();
//		ResultSet resultSet = statement.executeQuery("select mem_id, mem_name, mem_add1, mem_add2, mem_hp from member where mem_id = '" + memId + "'");
		PreparedStatement prepareStatement = connection.prepareStatement("select mem_id, mem_name, mem_add1, mem_add2, mem_hp, mem_mileage from member where mem_id = ?");
		prepareStatement.setString(1, id);
		ResultSet resultSet = prepareStatement.executeQuery();
		MemberVO memberVO = null;
		if (resultSet.next()) {
			String memId = resultSet.getString("mem_id");
			String memName = resultSet.getString("mem_name");
			String memAdd1 = resultSet.getString("mem_add1");
			String memAdd2 = resultSet.getString("mem_add2");
			String memHp = resultSet.getString("mem_hp");
			int memMileage = resultSet.getInt("mem_mileage");
			memberVO = new MemberVO(memId, memName, memAdd1, memAdd2, memHp, memMileage);
		}
		resultSet.close();
		prepareStatement.close();
		connection.close();
		return memberVO;
	}
	public void insert(MemberVO vo) throws Exception {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		Statement statement = connection.createStatement();
		statement.executeUpdate("insert into member (mem_id, mem_name, mem_add1, mem_add2, mem_hp) values ('" + vo.getMemId() + "','홍길동','대전','서구','010-1111-2222')");
		
	}
	public int update(MemberVO vo) throws Exception {
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
		String sql = "update member"
				+ " set mem_name = ?, mem_add1 = ?, mem_add2 = ?, mem_hp = ?"
				+ " where mem_id = ?";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, vo.getMemName());
		prepareStatement.setString(2, vo.getMemAdd1());
		prepareStatement.setString(3, vo.getMemAdd2());
		prepareStatement.setString(4, vo.getMemHp());
		prepareStatement.setString(5, vo.getMemId());
		int result = prepareStatement.executeUpdate();
		prepareStatement.close();
		connection.close();
		return result;
	}
	public void delete() {
		
	}
}
