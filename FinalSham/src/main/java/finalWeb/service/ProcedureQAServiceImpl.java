package finalWeb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import finalWeb.command.ProcedureQACommand;
import finalWeb.dao.ProcedureQADao;

@Controller
public class ProcedureQAServiceImpl implements ProcedureQAService {
	
	@Autowired
	private ProcedureQADao dao;

	public void setDao(ProcedureQADao dao) {
		this.dao = dao;
	}

	public List<ProcedureQACommand> getArticles(int startRow,int endRow,String search,int searchn) {
		List<ProcedureQACommand> list = null;
		
		if(search == null || search.equals(""))
			list = dao.getArticles(startRow, endRow);
		else
			list = dao.getArticles(startRow, endRow, searchn, search);
	

		return list;
	}
	
	public ProcedureQACommand getArticle(int qnANo) {
		ProcedureQACommand list = null;
		System.out.println(qnANo);
		try {                        //city는 mepper파일의 id값에 해당한다.
			list = dao.getArticle(qnANo);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public int getArticleCount(String search, int searchn){
		int count = 0;
		if(search == null || search.equals(""))
			count = dao.getArticleCount();
		else
			count = dao.getArticleCount(searchn,search);
		
		return count;
	}
 
//	public int insert(ProcedureQACommand article) {
//		int check =0;
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		
//	
//		
//		int num=article.getNum();
//		int ref=article.getRef();
//		int re_step=article.getRe_step();
//		int re_level=article.getRe_level();
//		String number=null;
//		int number1=0;
//		
//		number=dao.getMax();
//		
//		if(number!=null)
//			number1=dao.getMax1();
//		
//		if(number!=null){
//		number1 += 1;	
//		}
//		else{
//			number1 = 1;
//		}
//		
//		if(num!=0){
//			dao.updateRef(article);
//			re_step += 1;
//			re_level = re_level+1;
//		}else{
//			ref=number1;
//			re_step=0;
//			re_level=0;
//		}
//		
//		try {
//			System.out.println(article.getQnAContent());
//			map.put("writer", article.getWriter());
//			map.put("subject", article.getSubject());
//			map.put("passwd", article.getPasswd());
//			map.put("reg_date", article.getReg_date());
//			map.put("ref", ref);
//			map.put("re_step", re_step);
//			map.put("re_level", re_level);
//			map.put("QnAContent", article.getQnAContent());	
//			check = dao.Insert("myMem.insert", map);  //city는 내가 선택한 도시명
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//
//		return check;
//	}

	public int insert(ProcedureQACommand article) {
		int check =0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
	
		
		int qnANo=article.getQnANo();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		String number=null;
		int number1=0;
		
		number=dao.getMax();
		
		if(number!=null)
			number1=dao.getMax1();
		
		if(number!=null){
		number1 += 1;	
		}
		else{
			number1 = 1;
		}
		
		if(qnANo!=0){
			dao.updateRef(article);
			re_step += 1;
			re_level = re_level+1;
		}else{
			ref=number1;
			re_step=0;
			re_level=0;
		}
		
		try {
			System.out.println(article.getQnAContent());
			map.put("writer", article.getWriter());
			map.put("qnATitle", article.getQnATitle());
			map.put("passwd", article.getPasswd());
			map.put("qnADate", article.getQnADate());
			map.put("ref", ref);
			map.put("re_step", re_step);
			map.put("re_level", re_level);
			map.put("QnAContent", article.getQnAContent());	
			
			article.setRe_step(re_step);
			article.setRe_level(re_level);
			article.setRef(ref);
			check = dao.Insert("myMem.insert", article);  //city는 내가 선택한 도시명
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return check;
	}
	
	
	public int delete(int qnANo, String passwd) {
		int list;
		
		String check = dao.deletecheck(qnANo);
		
		if(check.equals(passwd)){
		
		try {
			list = dao.delete(qnANo);  //city는 내가 선택한 도시명
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 1;
		}
		else{
			return 0;
		}
		
	}
	
	
	public int updateArticle(ProcedureQACommand article,String passwd){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String pwcheck = dao.deletecheck(article.getQnANo());
		
		if(pwcheck.equals(article.getPasswd()))
		{
		
		map.put("qnANo",article.getQnANo());
		map.put("writer",article.getWriter());
		map.put("qnATitle", article.getQnATitle());
		map.put("passwd", article.getPasswd());
		map.put("qnAContent", article.getQnAContent());
		
		dao.update(map);
		
		System.out.println("updateArticle입니다");
		return 1;
		}
		
		else
			return 0;
		
	}
	
	public void QnAHits(int qnANo){
		System.out.println("QnAHits()실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("qnANo", qnANo);
		dao.QnAHits(qnANo);
	}

}
