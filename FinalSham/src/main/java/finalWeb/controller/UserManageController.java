package finalWeb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import finalWeb.command.BuyItemCommand;
import finalWeb.command.DesignerCommand;
import finalWeb.command.PerformCategoryCommand;
import finalWeb.command.UserCommand;
import finalWeb.dao.BuyItemDao;
import finalWeb.dao.PerformCategoryDao;
import finalWeb.service.UserManageService;

@Controller
public class UserManageController {

	@Autowired
	private UserManageService userManageService;

	public void setService(UserManageService service) {
		this.userManageService = service;
	}
	@Autowired
	private PerformCategoryDao performCategoryDao;
	
	@Autowired
	private BuyItemDao buyItemDao;
	
	

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
		count = userManageService.getUserCount(search, searchn);

		if (count > 0) {
			userList = userManageService.getUser(startRow, endRow, search, searchn);
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
	public String userInfoView(String id, ModelMap model, PerformCategoryCommand performCategoryCommand, BuyItemCommand buyItemCommand) throws Exception {

		List<UserCommand> userInfo = userManageService.userInfo(id);
		int visitCount = userManageService.visitCount(id);
		
		List<PerformCategoryCommand> PerformList= performCategoryDao.selectPerformList(id);
		
		List<BuyItemCommand> buyItemList = buyItemDao.buyItemList(id);
		
		model.addAttribute("id", id);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("PerformList", PerformList);
		model.addAttribute("buyItemList", buyItemList);
		model.addAttribute("visitCount", visitCount);

		return "content/userInfoView";
	}
	
	@RequestMapping(value = "/visitAddForm.do")
	public String visitAddForm(String id, ModelMap model, DesignerCommand designerCommand) throws Exception {
		
		List<DesignerCommand> designerList = userManageService.getDesigner();
		model.addAttribute("id", id);
		
		for (int i = 0; i < designerList.size(); i++) {
			
			System.out.println(designerList.get(i).getDesigner());
			
		}
		model.addAttribute("designerList", designerList);
		
		return "content/visitAdd";
	}
	
	@RequestMapping(value = "/visitAdd.do")
	public String visitAdd(String id, PerformCategoryCommand performCategoryCommand) throws Exception {
		performCategoryCommand.setId(id);
		
		userManageService.visitAdd(performCategoryCommand);
		
		return "redirect:/userInfoView.do?id="+id;
	}
	@RequestMapping(value = "/deleteUser.do")
	public String deleteUser(String id, PerformCategoryCommand performCategoryCommand) throws Exception {
		performCategoryCommand.setId(id);
		
		userManageService.deleteUser(performCategoryCommand);
		
		return "redirect:/userInfoView.do";
	}
	
/*	@RequestMapping(value = "/deleteUser.do")
	public void deleteUser(HttpServletResponse resp,String id, String pageNum,PerformCategoryCommand performCategoryCommand, HttpSession session) throws Exception {
		JSONObject jso = new JSONObject();
		
		performCategoryCommand.setId(id);
		
		userManageService.deleteUser(performCategoryCommand);
		///////////////////////////
		
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
		count = userManageService.getUserCount(search, searchn);

		if (count > 0) {
			userList = userManageService.getUser(startRow, endRow, search, searchn);
		}

		number = count - (currentPage - 1) * pageSize;

		jso.put("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("user", userList);
		///////////////////////////
		jso.put("", );
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); // 
		out.println(jso.toString());
				
	}*/
	
}
