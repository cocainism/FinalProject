package finalWeb.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import finalWeb.command.BuyItemCommand;
import finalWeb.command.ItemCommand;
import finalWeb.command.UserCommand;
import finalWeb.dao.BuyItemDao;
import finalWeb.dao.ItemDao;
import finalWeb.service.EmailSender;

@Controller
public class BuyItemController {

	@Autowired
	BuyItemDao buyItemDao;
	@Autowired
	ItemDao itemDao;
	@Autowired
    private EmailSender emailSender;
	
	@RequestMapping("buyItem.do")
	public String buyItem(@ModelAttribute("userCommand") UserCommand userCommand, BuyItemCommand buyItemCommand) throws Exception{		
		String reciver = userCommand.getEmail(); //��������� �̸����Դϴ�.
	    String subject = "'Sham'에서 결제한 내역을 알려드립니다.";
	        //itemDao.itemUpdateCount(itemCommand);	       
	        //System.out.println(itemCommand.getItemCount());
	    String content = "결제 내역: "+buyItemCommand.getItemName()+"가 결제 되었습니다.";	   
	    
	    buyItemDao.buyItem(buyItemCommand);
	        
	    emailSender.SendEmail(subject,content,reciver);
	    
		return "redirect:/orderListForm.do?id="+buyItemCommand.getId();
	}
}
