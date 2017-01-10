package finalWeb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.BuyItemCommand;

@Component
public class BuyItemDao {

	@Autowired
	SqlSession session;

	public void buyItem(BuyItemCommand buyItemCommand) {
		int check = session.insert("myBuyItem.buyItemAdd", buyItemCommand);

		if (check != 0) {
			System.out.println("결제 성공");
		} else {
			System.out.println("결제 실패");
		}
	}

	public List<BuyItemCommand> buyItemList(String id, int startRow, int endRow) {
		Map map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return session.selectList("myBuyItem.buyItemList", map);
	}
	
	public List<BuyItemCommand> buyItemList(String id) {
		List<BuyItemCommand> selectPerformList = session.selectList("myBuyItem.buyItemLists", id);

		return selectPerformList;
	}

	public int buyItemCount(BuyItemCommand buyItemCommand) {
		return session.selectOne("myBuyItem.buyItemCount", buyItemCommand);
	}
}