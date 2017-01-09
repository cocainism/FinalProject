package finalWeb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import finalWeb.command.UserCommand;
import finalWeb.dao.UserManageDao;

@Controller
public class UserManageServiceImpl implements UserManageService {
	
	@Autowired
	private UserManageDao dao;

	public void setDao(UserManageDao dao) {
		this.dao = dao;
	}

	public List<UserCommand> getUser(int startRow,int endRow,String search, int searchn){
		List<UserCommand> list = null;
		
		if(search == null || search.equals("")){
			list = dao.getUser(startRow, endRow);
		}else{
			list = dao.getUser(startRow, endRow, searchn, search);
		}

		return list;
	}
	
	public int getUserCount(String search, int searchn){
		int count = 0;
		if(search == null || search.equals("")){
			count = dao.getUserCount();
		}else{
			count = dao.getUserCount(searchn,search);
		}
		
		return count;
	}
	
	public List<UserCommand> userInfo(String id){
		List<UserCommand> userInfo = null;
		userInfo = dao.getUserInfo(id);
		
		return userInfo;
		
	}
	
	public int visitCount(String id){
		System.out.println("Impl==="+id);
		int visitCount = 0;
		visitCount = dao.visitCount(id);
		System.out.println("visitCount==="+visitCount);
		return visitCount;
	}
}
