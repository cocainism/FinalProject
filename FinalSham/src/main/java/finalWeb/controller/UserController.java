package finalWeb.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import finalWeb.command.BuyItemCommand;
import finalWeb.command.UserCommand;
import finalWeb.dao.BuyItemDao;
import finalWeb.dao.UserDao;
import finalWeb.service.*;
import net.sf.json.JSONObject;


@Controller
public class UserController {

	@Autowired
	private UserDao userDao;
	@Autowired
	private BuyItemDao buyItemDao;
	@Autowired
    private EmailSender emailSender;
	
	@RequestMapping("/joinForm.do")
	public String joinForm(@ModelAttribute() UserCommand userCommand){
		//dao.join(userCommand);
		return "user/joinForm"; 
	}
	
	@RequestMapping("/join.do")
	public String join(@ModelAttribute("userCommand") UserCommand userCommand){
		userDao.join(userCommand);
		return "redirect:/main.do"; 
	}
	
	@RequestMapping("/duplicatedId.do")
	public void duplicatedId(HttpServletResponse resp, UserCommand userCommand) throws Exception {
		JSONObject jso = new JSONObject(); // json��ü�� �ѱ���̱⶧����
		
		if (userDao.email(userCommand) == null) {
			jso.put("check", 1);
		}else {
			jso.put("check", 0);
		}

		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); // response���ٰ� �����͸� �����Ҽ� �ְ� ����
		out.println(jso.toString()); // response���״ٰ� ����� ��Ŵ
	}
	
	@RequestMapping("/findForm.do")
	public String findForm(){
		return "user/findForm";
	}
	
	@RequestMapping("/findId.do")
	public String findId(@ModelAttribute("userCommand") UserCommand userCommand) throws Exception{
        String reciver = userCommand.getEmail(); //��������� �̸����Դϴ�.
        String subject = "���̵� ��û�� ���� ��";
        
        if(userDao.info(userCommand).getName()!=null && userDao.info(userCommand).getEmail()!=null){
        	String content = "������� ���̵�� "+userDao.info(userCommand).getId();    	
        	emailSender.SendEmail(subject,content,reciver);
        }
        
		return "redirect:/main.do"; 
	}
	
	@RequestMapping("/findPwd.do")
	public String findPwd(@ModelAttribute("userCommand") UserCommand userCommand) throws Exception{
        String reciver = userCommand.getEmail(); //��������� �̸����Դϴ�.
        String subject = "��й�ȣ ��û�� ���� ��";
        
        if(userDao.info(userCommand).getName()!=null && userDao.info(userCommand).getEmail()!=null){
        	String pwd = " ";
        	for(int i=0; i<7; i++){
        		 pwd += (char) (new Random().nextInt(127)+33);
        		 System.out.println(pwd);
        	}
        	
        	userCommand.setPassword(pwd);
        	String content = "���� �� ��й�ȣ��"+pwd+"�Դϴ�.";
        	userDao.updatePwd(userCommand);
        	emailSender.SendEmail(subject,content,reciver);
        }
		return "redirect:/main.do"; 
	}
	
	@RequestMapping("/myPageForm.do")
	public String myPageFrom(){		
		return "myPage/myPageForm";
	}
	
	@RequestMapping("/modifyForm.do")
	public String modifyForm(){		
		return "myPage/modifyForm";
	}
	
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("userCommand") UserCommand userCommand, HttpSession session){	
		userDao.updateInfo(userCommand);
		session.setAttribute("myInfo", userDao.info(userCommand));
		return "redirect:/myPageForm.do";
	}
	
	@RequestMapping("/deleteForm.do")
	public String deleteForm(){		
		return "myPage/deleteForm";
	}
	
	@RequestMapping("/delete.do")
	public String delete(@ModelAttribute("userCommand") UserCommand userCommand, HttpSession session){		
		userDao.deleteInfo(userCommand);
		session.invalidate();
		return "redirect:/main.do"; 
	}
	
	@RequestMapping("/orderListForm.do")
	public String orderListForm(BuyItemCommand buyItemCommand,Model model){	
		System.out.println(buyItemCommand.getId()); 
		System.out.println("사이즈:"+buyItemDao.buyItemList(buyItemCommand).size());
		model.addAttribute("buyItemList",buyItemDao.buyItemList(buyItemCommand));
		model.addAttribute("buyItemCount",buyItemDao.buyItemCount());
		return "myPage/orderListForm";
	}
}
