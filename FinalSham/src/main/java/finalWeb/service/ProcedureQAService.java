package finalWeb.service;

import java.util.List;

import org.springframework.stereotype.Controller;

import finalWeb.command.ProcedureQACommand;
@Controller
public interface ProcedureQAService {
	public List<ProcedureQACommand> getArticles(int startRow,int endRow,String search, int searchn);
	public ProcedureQACommand getArticle(int qnANo);
	public int getArticleCount(String search, int searchn);
	public int insert(ProcedureQACommand article);
	public int delete(int qnANo, String passwd);
	public int updateArticle(ProcedureQACommand article,String passwd);
	public void QnAHits(int qnANo);
}
