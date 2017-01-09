package finalWeb.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import finalWeb.command.ItemListCommand;
import finalWeb.command.UserCommand;
import finalWeb.dao.ItemDao;
import finalWeb.dao.UserDao;
import finalWeb.service.EmailSender;
import net.sf.json.JSONObject;

@Controller
public class ItemController {

	@Autowired
	private ItemDao itemDao;
	@Autowired
    private EmailSender emailSender;
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/itemForm.do", method= RequestMethod.GET )
	public ModelAndView itemForm(Model model){		
		List<ItemCommand> itemCommand = itemDao.itemList(); 
		
		ModelAndView mav = new ModelAndView("item/itemForm", "itemCommand", itemCommand);
		model.addAttribute("itemList",itemDao.itemListInfo());
		return mav;
	}
	
	
	@RequestMapping("itemAddForm.do")
	public ModelAndView itemAddFrom(){
		ModelAndView mav = new ModelAndView("item/itemAddForm","itemType",itemDao.itemListInfo());
		return mav;
	}

	@RequestMapping(value = "itemAdd.do", produces="text/plain;charset=UTF-8")
	public String itemAdd(HttpServletRequest request, @RequestParam("photo") MultipartFile photo, @ModelAttribute("itemCommand")ItemCommand itemCommand){
		String originalFilename = photo.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); //fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // Ȯ����
		String fileName = onlyFileName.replaceAll(" ", "");
		String fullPath = "C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\fileList" + "\\" + fileName+extension;
		itemCommand.setItemPhoto(fileName+extension);			
		itemDao.itemAdd(itemCommand);
		if(!photo.isEmpty()){
			try{
				File file = new File(fullPath);		
				photo.transferTo(file);// �ش� ��η� �̵�~
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return "redirect:/itemForm.do";
	}
	
	@RequestMapping(value="itemListAdd.do",method= RequestMethod.POST)
	public void itemListAdd(HttpServletResponse resp,ItemListCommand itemListCommand) throws Exception{		
		
		itemDao.itemListAdd(itemListCommand);
		List<ItemListCommand> itemList = itemDao.itemListInfo();
		Collections.reverse(itemList);
		JSONObject jso = new JSONObject();
		
		jso.put("itemList",itemList); 
	
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); 
		out.println(jso.toString()); 
	}
	
	@RequestMapping(value="itemListDelete.do",method= RequestMethod.POST)
	public void itemListDelete(HttpServletResponse resp,ItemListCommand itemListCommand) throws Exception{		
		
		itemDao.itemListDelete(itemListCommand);
		
		List<ItemListCommand> itemList = itemDao.itemListInfo();
		Collections.reverse(itemList);
		JSONObject jso = new JSONObject();
		
		jso.put("itemList",itemList); 
	
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); 
		out.println(jso.toString()); 
	}
	
	@RequestMapping("itemModifyForm.do")
	public String itemModifyForm(ItemCommand itemCommand, Model model){		
		model.addAttribute("item",itemDao.itemInfo(itemCommand));
		return "item/itemModifyForm";
	}
	@RequestMapping("itemModify.do")
	public String itemModify(HttpServletRequest request, @RequestParam("photo") MultipartFile photo,ItemCommand itemCommand){	
		System.out.println("1");
		System.out.println("수정");
		System.out.println("2");
		String originalFilename = photo.getOriginalFilename();

		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); //fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // Ȯ����
		String fullPath = "C:\\Users\\user2\\git\\Sham\\FinalSham\\WebContent\\fileList" + "\\" + onlyFileName+extension;
		itemCommand.setItemPhoto(onlyFileName+extension);
		
		itemDao.itemUpdate(itemCommand);
		
		if(!photo.isEmpty()){
			try{
				File file = new File(fullPath);		
				photo.transferTo(file);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:/itemForm.do";
	}
	
	@RequestMapping("itemDelete.do")
	public String itemDelete(ItemCommand itemCommand){
		System.out.println("delete");
		itemDao.itemDelete(itemCommand);
		return "redirect:/itemForm.do";
	}
	
	@RequestMapping("itemInfoForm.do")
	public ModelAndView itemInfoForm(ItemCommand itemCommand){
		ModelAndView mav = new ModelAndView("item/itemInfoForm","item",itemDao.itemInfo(itemCommand));
		return mav;
	}
	
/*	@RequestMapping("pay.do")
	public String pay(@ModelAttribute("userCommand") UserCommand userCommand, ItemCommand itemCommand) throws Exception{
			System.out.println(userCommand.getEmail());
			System.out.println(userCommand.getEmail());
	        String reciver = userCommand.getEmail(); //��������� �̸����Դϴ�.
	        String subject = "'Sham'에서 결제한 내역을 알려드립니다.";
	        itemDao.itemUpdateCount(itemCommand);	       
	        System.out.println(itemCommand.getItemCount());
	        String content = "결제 내역: "+itemCommand.getItemName()+"가 결제 되었습니다.";
	        emailSender.SendEmail(subject,content,reciver);
	    
		return "redirect:/itemForm.do";
	}
*/
	
}
