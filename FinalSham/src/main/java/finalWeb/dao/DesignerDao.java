package finalWeb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.DesignerCommand;

@Component
public class DesignerDao {

	@Autowired
	SqlSession session;

	public List<Map> selectDesignerList() {
		return session.selectList("designer.selectDesignerList");
	}
	
	public DesignerCommand selectDesigner(DesignerCommand designerCommand) {
		return session.selectOne("designer.selectDesigner",designerCommand);
	}
	
	public void insertDesigner(DesignerCommand designerCommand) {
		session.insert("designer.insertDesigner", designerCommand);
	}

	public void insertDesignerAll(DesignerCommand designerCommand) {
		session.insert("designer.insertDesigner", designerCommand);

	}

	public int deleteDesignerAll() {
		return session.delete("designer.deleteDesignerAll");

	}

	public void updateDesigner(DesignerCommand designerCommand) {
		session.update("designer.updateDesigner", designerCommand);
	}

	public void deleteDesigner(int designerNo) {
		session.delete("designer.deleteDesigner", designerNo);
	}

	public void photoUpdateDesigner(DesignerCommand designerCommand) {
		session.update("designer.photoUpdateDesigner", designerCommand);
		
	}

}
