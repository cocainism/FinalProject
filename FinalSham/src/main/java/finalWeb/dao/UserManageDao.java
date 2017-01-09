package finalWeb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.ProcedureQACommand;
import finalWeb.command.UserCommand;

// »ç¿ëÀÚ
@Component
public class UserManageDao {

	@Autowired
	SqlSession session;

	@SuppressWarnings("rawtypes")
	public List<Map> selectUserList() {
		return session.selectList("userManage.selectUserList");
	}

	public int getUserCount() {
		return session.selectOne("userManage.userCount", Integer.class);
	}

	public List<UserCommand> getUser(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return session.selectList("userManage.userAll", map);
	}

	@SuppressWarnings("unchecked")
	public int getUserCount(int n, String searchKeyword) {

		@SuppressWarnings("rawtypes")
		Map map = new HashMap<String, Object>();

		map.put("searchN", n);
		map.put("searchKeyword", searchKeyword);

		int i = session.selectOne("userManage.searchUserCount", map);
		return i;

	}

	@SuppressWarnings("unchecked")
	public List<UserCommand> getUser(int start, int end, int n, String searchKeyword) {
		@SuppressWarnings("rawtypes")
		Map map = new HashMap<String, Object>();

		map.put("startRow", start);
		map.put("endRow", end);
		map.put("searchN", n);
		map.put("searchKeyword", searchKeyword);

		return session.selectList("userManage.searchUser", map);
	}

	public List<UserCommand> getUserInfo(String id) {

		return session.selectList("userManage.userInfo", id);
	}

	public int visitCount(String id) {
		System.out.println("DAO====" + id);
 
		int i = session.selectOne("userManage.visitCount", id);
		
		System.out.println(i);
		return i;
	}

}
