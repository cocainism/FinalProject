package finalWeb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.UserCommand;

@Component
public class LoginDao {
	
	@Autowired
	SqlSession session;
	
	public UserCommand login(UserCommand userCommand){		
		return (UserCommand)session.selectOne("myUser.isId",userCommand);
	}

}
