package finalWeb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.BasketCommand;
import finalWeb.command.BuyItemCommand;
import finalWeb.command.ItemCommand;

@Component
public class BuyItemDao {

	@Autowired
	SqlSession session;
	
	public void buyItem(BuyItemCommand buyItemCommand){
		int check = session.insert("myBuyItem.buyItemAdd",buyItemCommand);
		
		if(check != 0 ){
			System.out.println("결제 성공");
		}else{
			System.out.println("결제 실패");
		}
	}
	
	public List<BuyItemCommand> buyItemList(BuyItemCommand buyItemCommand){
		return session.selectList("myBuyItem.buyItemList",buyItemCommand);
	}
	
	public int buyItemCount(){
		return session.selectOne("myBuyItem.buyItemCount");
	}
	
}
