package finalWeb.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import finalWeb.command.UserCommand;
@Controller
public interface UserManageService {
	
	public List<UserCommand> getUser(int startRow,int endRow, String search, int searchn);
	public int getUserCount(String search, int searchn);
	public List<UserCommand> userInfo(String id);
	public int visitCount(String id);	
	
	
}
