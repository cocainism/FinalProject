package finalWeb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalWeb.command.UserCommand;
import finalWeb.service.ProcedureQAService;
import finalWeb.service.UserManageService;

@Controller
public class UserManageController {

	@Autowired
	private UserManageService service;

	public void setService(UserManageService service) {
		this.service = service;
	}

	@RequestMapping(value = "/userManage.do")
	public String userView(ModelMap model, String pageNum, String search, @RequestParam(defaultValue = "0") int searchn)
			throws Exception {

		if (pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;

		List<UserCommand> userList = null;
		count = service.getUserCount(search, searchn);

		if (count > 0) {
			userList = service.getUser(startRow, endRow, search, searchn);
		}

		number = count - (currentPage - 1) * pageSize;

		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("user", userList);
		model.addAttribute("search", search);
		model.addAttribute("searchn", searchn);

		return "content/userManage";
	}

	@RequestMapping(value = "/userInfoView.do")
	public String userInfoView(String id, ModelMap model) throws Exception {

		model.addAttribute("id", id);
		
		List<UserCommand> userInfo = service.userInfo(id);
		int visitCount = service.visitCount(id);
		
		System.out.println("Con-visitCount"+visitCount);

		model.addAttribute("userInfo", userInfo);
		model.addAttribute("visitCount", visitCount);

		return "content/userInfoView";
	}

}
