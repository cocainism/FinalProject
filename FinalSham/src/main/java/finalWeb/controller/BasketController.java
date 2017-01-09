package finalWeb.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import finalWeb.command.BasketCommand;
import finalWeb.command.ItemCommand;
import finalWeb.dao.BasketDao;
import finalWeb.dao.ItemDao;
import net.sf.json.JSONObject;

import java.util.*;

@Controller
public class BasketController {

	@Autowired
	BasketDao basketDao; 

	@RequestMapping("/basketForm.do")
	public ModelAndView basketForm(BasketCommand basketCommand){
		
		ModelAndView mav = new ModelAndView("basket/basketForm","basketList",basketDao.showBasket(basketCommand));
		return mav;
	}
	
	@RequestMapping("/basketDelete.do")
	public void basketDelete(BasketCommand basketCommand,Model model){
		basketDao.basketDelete(basketCommand);
		model.addAttribute("basketList",basketDao.showBasket(basketCommand));
	}
	
	@RequestMapping(value="/basketAddReload.do", method= RequestMethod.POST)
	public void basketAddReload(HttpServletResponse resp, BasketCommand basketCommand, HttpSession session) throws Exception{
		
		JSONObject jso = new JSONObject(); // json��ü�� �ѱ���̱⶧���� 
		
		if(basketDao.check(basketCommand)==null){			
			if(basketCommand.getItemCount() == null){
				basketCommand.setItemCount("1");
			}
			basketDao.basketAdd(basketCommand);
			session.setAttribute("count", basketDao.basketCount(basketCommand.getId()));
			jso.put("count", basketDao.basketCount(basketCommand.getId())); // data��� Ű�� list�����͸� ������ ���ѳ���(data�� ���)	
		}else{
			jso.put("check", 0);
		}
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); // response���ٰ� �����͸� �����Ҽ� �ְ� ����
		out.println(jso.toString()); // response���״ٰ� ����� ��Ŵ
	}
	
	@RequestMapping(value="/basketDeleteReload.do", method= RequestMethod.POST)
	public void basketDeleteReload(HttpServletResponse resp, BasketCommand basketCommand, HttpSession session) throws Exception{

		basketDao.basketDelete(basketCommand);
		session.setAttribute("count", basketDao.basketCount(basketCommand.getId()));
		
		List<ItemCommand> basketList = basketDao.showBasket(basketCommand);
		
		JSONObject jso = new JSONObject();
		jso.put("basketList", basketList); 
		
		jso.put("count", basketDao.basketCount(basketCommand.getId()));
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); 
		out.println(jso.toString()); 
	}
	
	
}

