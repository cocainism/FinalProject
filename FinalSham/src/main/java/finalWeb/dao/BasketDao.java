package finalWeb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bouncycastle.crypto.generators.BaseKDFBytesGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.BasketCommand;
import finalWeb.command.ImageCommand;
import finalWeb.command.ItemCommand;
import finalWeb.command.UserCommand;

@Component
public class BasketDao {
	
	@Autowired
	SqlSession session;
	
	public List<ItemCommand> showBasket(BasketCommand basketCommand){
		return session.selectList("myBasket.showBasket",basketCommand);
	}
	
	public void basketAdd(BasketCommand basketCommand){
		session.insert("myBasket.basketAdd", basketCommand);
	}
	
	public BasketCommand check(BasketCommand basketCommand){
		return session.selectOne("myBasket.check", basketCommand);
	}
	
	public int basketCount(String id){
		return session.selectOne("myBasket.basketCount", id);
	}
	
	public void basketDelete(BasketCommand basketCommand){
		int check = session.delete("myBasket.basketDelete",basketCommand);
		
		if( check != 0){
			System.out.println(basketCommand.getItemName()+"을 장바구니 삭제 완료");
		}else{
			System.out.println(basketCommand.getItemName()+"을 장바구니 삭제 실패");
		}
		
	}
}
