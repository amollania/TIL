package lecture26;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class InfoDAO {
	public List<InfoModel> selectInfo() {
		List<InfoModel> list = new ArrayList<InfoModel>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		try {
			DriverManager.registerDriver(new OracleDriver());
			connection = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.2:1521", "java", "oracle");
			statement = connection.prepareStatement("select info_no, pc_no, nm, email, hobby, check_yn from info");
			resultSet = statement.executeQuery();
			while(resultSet.next()) {
				int infoNo = resultSet.getInt("info_no");
				String pcNo = resultSet.getString("pc_no");
				String nm = resultSet.getString("nm");
				String email = resultSet.getString("email");
				String hobby = resultSet.getString("hobby");
				String checkYn = resultSet.getString("check_yn");
				list.add(new InfoModel(infoNo, pcNo, nm, email, hobby, checkYn));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				statement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 편집 메소드 만들기, return 타입이 string이라면 null
	public int updateInfo(InfoModel info) {
		int executeUpdate = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			DriverManager.registerDriver(new OracleDriver());
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@192.168.10.2:1521", "java", "oracle");
			statement = connection.prepareStatement(
					"UPDATE INFO SET NM = ?, EMAIL = ?, HOBBY = ?, CHECK_YN = ? WHERE INFO_NO = ?");
			statement.setString(1, info.getNm());
			statement.setString(2, info.getEmail());
			statement.setString(3, info.getHobby());
			statement.setString(4, info.getCheckYn());
			statement.setInt(5, info.getInfoNo());
			executeUpdate = statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				statement.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return executeUpdate;
	}
}
