package finalWeb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.PerformCategoryCommand;

@Component
public class PerformCategoryDao {
	
	@Autowired
	SqlSession session;
	
	public List<PerformCategoryCommand> getPerform(String id){
		
		List<PerformCategoryCommand> list = session.selectList("myProcedure.getProcedure", id);
		return list;
	}

	public List<PerformCategoryCommand> selectPerformList(String id) {
		List<PerformCategoryCommand> selectPerformList = session.selectList("myProcedure.selectPerformList", id);
		return selectPerformList;
	}

}
