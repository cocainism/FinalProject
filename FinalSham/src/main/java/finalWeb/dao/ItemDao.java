package finalWeb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import finalWeb.command.ItemCommand;
import finalWeb.command.ItemListCommand;
import finalWeb.command.PictureCommand;

import java.util.*;
//��ǰ
@Component
public class ItemDao {

	@Autowired
	SqlSession session;
	
	public List<ItemCommand> itemList(){
		return session.selectList("myItem.itemList");
	}
	
	public List<ItemListCommand> itemListInfo(){
		return session.selectList("myItem.itemListInfo");
	}
	
	public ItemCommand itemInfo(ItemCommand itemCommand){
		return session.selectOne("myItem.itemInfo",itemCommand);
	}
	
	// 아이템 목록 추가
	public void itemListAdd(ItemListCommand itemListCommand){
		int check = session.insert("myItem.itemListAdd",itemListCommand);
		
		if(check !=0){
			System.out.println("아이템 목록 추가 성공");
		}else{
			System.out.println("아이템 목록 추가 실패");
		}
	}
	
	// 아이템 목록 삭제
	public void itemListDelete(ItemListCommand itemListCommand){
		int check = session.insert("myItem.itemListDelete",itemListCommand);
		
		if(check !=0){
			System.out.println("아이템 목록 삭제 성공");
		}else{
			System.out.println("아이템 목록 삭제 실패");
		}
	}
	
	//아이템 추가
	public void itemAdd(ItemCommand itemCommand){
		int check = session.insert("myItem.itemAdd",itemCommand);
		if(check !=0){
			System.out.println("아이템 추가 성공");
		}else{
			System.out.println("아이템 추가 실패");
		}
	}
	
	//아이템 수정
	public void itemUpdate(ItemCommand itemCommand){
		System.out.println("수정2");
		int check = session.update("myItem.itemUpdates", itemCommand);
		if(check !=0){
			System.out.println("아이템 수정 성공");
		}else{
			System.out.println("아이템 수정 실패");
		}
	}
	
	public void itemUpdateCount(ItemCommand itemCommand){
		int check = session.update("myItem.itemUpdateCount", itemCommand);
		if(check !=0){
			System.out.println("아이템 수정 성공");
		}else{
			System.out.println("아이템 수정 실패");
		}
	}
	
	//아이템 삭제
	public void itemDelete(ItemCommand itemCommand){
		int check = session.delete("myItem.itemDelete",itemCommand);
		if(check !=0){
			System.out.println("아이템 삭제 성공");
		}else{
			System.out.println("아이템 삭제 실패");
		}
	}
}
