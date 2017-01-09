package finalWeb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.StyleCommand;

//��Ÿ��
@Component
public class StyleDao {
	
	@Autowired
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public void insertStyle(StyleCommand command){
		int x = session.insert("style.insertStyle", command);
		
		if(x != 0){
			System.out.println("insert 성공");
		}else{
			System.out.println("insert 실패");
		}
	}
	
	public List<StyleCommand> getStyle(){
		List<StyleCommand> list = session.selectList("style.selectAll");
		String str = "";
		for(int i = 0; i < list.size(); i++){
			str = list.get(i).getStylePhoto();
			str = str.substring(0, str.indexOf(","));
			list.get(i).setStylePhoto(str);
		}
		
		return list;
	}
	
	public StyleCommand getStyleInfo(String styleNum){
		StyleCommand styleCommand = session.selectOne("style.selectStyle", styleNum);
		session.update("style.updateViewCount", styleCommand);
		
		return styleCommand;
	}
	
	public StyleCommand getStyleInfo2(String styleNum){
		StyleCommand styleCommand = session.selectOne("style.selectStyle", styleNum);
		
		return styleCommand;
	}
	
	public void updateStyle(StyleCommand command){
		int x = session.update("style.updateStyle", command);
		
		if(x != 0){
			System.out.println("update 성공");
		}else{
			System.out.println("update 실패");
		}
	}
	
	public void deleteStyle(String styleNum){
		int x = session.delete("style.deleteStyle", styleNum);
		
		if(x != 0){
			System.out.println("delete 성공");
		}else{
			System.out.println("delete 실패");
		}
	}
	
	public List<String> getDesigner(){
		List<String> list = session.selectList("style.selectDesigner");
		
		return list;
	}
}
//String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); //fileName
//String extension = originalFilename.substring(originalFilename.indexOf(".")); // Ȯ����