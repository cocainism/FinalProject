package finalWeb.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.ss.util.SSCellRange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

@Component
public class MainDao {
	
	@Autowired
	SqlSession session;
	
	public List<Map> selectMainList() throws Exception{
		return session.selectList("main.selectMainList");
	}
	
	public List<Map> selectSliderList() throws Exception{
		return session.selectList("main.selectSliderList");
	}
	
	public int deleteSliderList(ModelMap model, String sliderVar) throws Exception{
		return session.delete("main.deleteSliderList", sliderVar);
	}
	
	public int deleteSliderAll() throws Exception{
		return session.delete("main.deleteSliderAll");
	}
	
	public void insertSliderAll(ArrayList<String> list) throws Exception{
		Map<String, ArrayList<String>> map = new  HashMap<String, ArrayList<String>>();
		map.put("sliderVar", list);
		for (String slider : list) {
			session.insert("main.insertSliderAll", slider);
		}
		
	}

	public void insertSlider(String fileName) {
		session.insert("main.insertSlider", fileName);
	}
	
}
