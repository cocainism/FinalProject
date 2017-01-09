package finalWeb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.ProcedureQACommand;

@Component
public class ProcedureQADao{ // sql세션팩토링 주입받으면
														// SqlSessionDaoSupport
														// 사용가능
	@Autowired
	SqlSession session;
	
	public List<ProcedureQACommand> getArticles(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProcedureQACommand> getArticles =session.selectList("myMem.getArticles", map);
		System.out.println(getArticles.size());
		return getArticles;
	}

	public int getArticleCount() {
		int count =session.selectOne("myMem.getArticleCount", Integer.class); // cityMapper																		// 실행
		return count;
	}

	public ProcedureQACommand getArticle(int qnANo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("qnANo", qnANo);
		ProcedureQACommand getArticle =session.selectOne("myMem.getArticle", map);
		return getArticle;
	}

//	public int Insert(String string, Map<String, Object> list) {
//		int check =session.insert(string, list);
//		return check;
//	}

	public int Insert(String string, ProcedureQACommand list) {
		int check =session.insert(string, list);
		return check;
	}
	public String deletecheck(int qnANo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("qnANo", qnANo);

		String passwd =session.selectOne("myMem.deletepw", map);

		return passwd;
	}

	public int delete(int qnANo) {
		int check =session.delete("myMem.delete", qnANo);
		return check;
	}

	public int update(Map<String, Object> map) {
		session.update("myMem.update", map);
		return 1;
	}

	public String getMax() {
		String number =session.selectOne("myMem.getMax");
		return number;
	}

	public int getMax1() {
		
		int number =session.selectOne("myMem.getMax1");
		
		return number;
	}

	public void updateRef(ProcedureQACommand article) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref", article.getRef());
		map.put("re_step", article.getRe_step());
		session.update("myMem.updateRef", map);

	}

	public void QnAHits(int qnANo) {
		int i =session.update("myMem.QnAHits", qnANo);
	}

	public int getArticleCount(int n, String searchKeyword){
		int x = 0;
		Map map = new HashMap<String,Object>();	
		map.put("searchN", n);
		map.put("searchKeyword", searchKeyword);
		x =session.selectOne("myMem.getArticleCount", Integer.class); // cityMapper		
		return x;
	}

	public List getArticles(int start, int end, int n, String searchKeyword){
		Map map = new HashMap<String,Object>();
		map.put("startRow", start);
		map.put("endRow", end);
		map.put("searchN", n);
		map.put("searchKeyword", searchKeyword);
		
		List<ProcedureQACommand> list =session.selectList("myMem.searchgetArticles",map);
		return list;
	}
	
	
	/////////////////////////////////////
	
}