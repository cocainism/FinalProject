package finalWeb.service;

import java.util.List;

import org.springframework.stereotype.Controller;

import finalWeb.command.DesignerCommand;
import finalWeb.command.PerformCategoryCommand;
import finalWeb.command.UserCommand;
@Controller
public interface UserManageService {
	
	public List<UserCommand> getUser(int startRow,int endRow, String search, int searchn);
	public int getUserCount(String search, int searchn);
	public List<UserCommand> userInfo(String id);
	public int visitCount(String id);
	public List<DesignerCommand> getDesigner();
	public int visitAdd(PerformCategoryCommand performCategoryCommand);	
	
	
}
