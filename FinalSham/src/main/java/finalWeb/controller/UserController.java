package finalWeb.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import finalWeb.command.BuyItemCommand;
import finalWeb.command.PerformCategoryCommand;
import finalWeb.command.UserCommand;
import finalWeb.dao.BuyItemDao;
import finalWeb.dao.PerformCategoryDao;
import finalWeb.dao.UserDao;
import finalWeb.service.EmailSender;
import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;
	@Autowired
	private BuyItemDao buyItemDao;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private PerformCategoryDao performCategoryDao;

	@RequestMapping("/joinForm.do")
	public String joinForm(@ModelAttribute() UserCommand userCommand) {
		// dao.join(userCommand);
		return "user/joinForm";
	}

	@RequestMapping("/join.do")
	public String join(@ModelAttribute("userCommand") UserCommand userCommand) {
		userDao.join(userCommand);
		return "redirect:/main.do";
	}

	@RequestMapping("/duplicatedId.do")
	public void duplicatedId(HttpServletResponse resp, UserCommand userCommand) throws Exception {
		JSONObject jso = new JSONObject(); // json占쏙옙체占쏙옙 占싼깍옙占쏙옙堅粹㏆옙占쏙옙占�

		if (userDao.email(userCommand) == null) {
			jso.put("check", 1);
		} else {
			jso.put("check", 0);
		}

		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); // response占쏙옙占쌕곤옙 占쏙옙占쏙옙占싶몌옙
											// 占쏙옙占쏙옙占쌀쇽옙 占쌍곤옙 占쏙옙占쏙옙
		out.println(jso.toString()); // response占쏙옙占쌓다곤옙 占쏙옙占쏙옙占� 占쏙옙킴
	}

	@RequestMapping("/findForm.do")
	public String findForm() {
		return "user/findForm";
	}

	@RequestMapping("/findId.do")
	public String findId(@ModelAttribute("userCommand") UserCommand userCommand) throws Exception {
		String reciver = userCommand.getEmail(); // 占쏙옙占쏙옙占쏙옙占쏙옙占� 占싱몌옙占쏙옙占쌉니댐옙.
		String subject = "占쏙옙占싱듸옙 占쏙옙청占쏙옙 占쏙옙占쏙옙 占쏙옙";

		if (userDao.info(userCommand).getName() != null && userDao.info(userCommand).getEmail() != null) {
			String content = "占쏙옙占쏙옙占쏙옙占� 占쏙옙占싱듸옙占� " + userDao.info(userCommand).getId();
			emailSender.SendEmail(subject, content, reciver);
		}

		return "redirect:/main.do";
	}

	@RequestMapping("/findPwd.do")
	public String findPwd(@ModelAttribute("userCommand") UserCommand userCommand) throws Exception {
		String reciver = userCommand.getEmail(); // 占쏙옙占쏙옙占쏙옙占쏙옙占� 占싱몌옙占쏙옙占쌉니댐옙.
		String subject = "占쏙옙橘占싫� 占쏙옙청占쏙옙 占쏙옙占쏙옙 占쏙옙";

		if (userDao.info(userCommand).getName() != null && userDao.info(userCommand).getEmail() != null) {
			String pwd = " ";
			for (int i = 0; i < 7; i++) {
				pwd += (char) (new Random().nextInt(127) + 33);
				System.out.println(pwd);
			}

			userCommand.setPassword(pwd);
			String content = "占쏙옙占쏙옙 占쏙옙 占쏙옙橘占싫ｏ옙占�" + pwd + "占쌉니댐옙.";
			userDao.updatePwd(userCommand);
			emailSender.SendEmail(subject, content, reciver);
		}
		return "redirect:/main.do";
	}

	@RequestMapping("/myPageForm.do")
	public String myPageFrom() {
		return "myPage/myPageForm";
	}

	@RequestMapping("/modifyForm.do")
	public String modifyForm() {
		return "myPage/modifyForm";
	}

	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("userCommand") UserCommand userCommand, HttpSession session) {
		userDao.updateInfo(userCommand);
		session.setAttribute("myInfo", userDao.info(userCommand));
		return "redirect:/myPageForm.do";
	}

	@RequestMapping("/deleteForm.do")
	public String deleteForm() {
		return "myPage/deleteForm";
	}

	@RequestMapping("/delete.do")
	public String delete(@ModelAttribute("userCommand") UserCommand userCommand, HttpSession session) {
		userDao.deleteInfo(userCommand);
		session.invalidate();
		return "redirect:/main.do";
	}

	@RequestMapping("/orderListForm.do")
	public String orderListForm(String pageNum, BuyItemCommand buyItemCommand, Model model) {
		if (pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 4;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
		int count = buyItemDao.buyItemCount(buyItemCommand);
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageBlock = 10;
		int result = currentPage / 10;

		int startPage = result * 10 + 1;
		int endPage = startPage + pageBlock - 1;

		System.out.println(buyItemCommand.getId());
		// System.out.println("사이즈:"+buyItemDao.buyItemList(buyItemCommand).size());

		model.addAttribute("buyItemList", buyItemDao.buyItemList(buyItemCommand.getId(), startRow, endRow));
		model.addAttribute("buyItemCount", buyItemDao.buyItemCount(buyItemCommand));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);

		return "myPage/orderListForm";
	}

	@RequestMapping("/procedureListForm.do")
	public String procedureListForm(ModelMap model, String id) {

		List<PerformCategoryCommand> list = performCategoryDao.getPerform(id);

		model.addAttribute("procedureList", list);
		model.addAttribute("size", list.size());

		return "myPage/procedureListForm";
	}

	@RequestMapping("/procedureListXml.do")
	public ModelAndView procedureListXml(String id) {
		List<PerformCategoryCommand> list = performCategoryDao.getPerform(id);

		return new ModelAndView("procedureListXml", "procedureList", list);
	}

}
