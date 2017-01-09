package finalWeb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.ShopInfoCommand;

@Component
public class ShopInfoDao {

	@Autowired
	SqlSession session;

	public int insertshopInfo(ShopInfoCommand shopInfoCommand) {
		return session.insert("shopInfo.insertShopInfo", shopInfoCommand);

	}

	@SuppressWarnings("rawtypes")
	public List<Map> selectshopInfoList() {
		return session.selectList("shopInfo.selectShopInfo");
	}

	public int deleteShopInfo() {
		return session.delete("shopInfo.deleteShopInfo");
	}

}
