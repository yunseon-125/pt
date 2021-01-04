package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	//방명록 목록
	public List<GuestBookDTO> getList(String searchkey, String search){
		//mybatis 실행 객체
		SqlSession session=MybatisManager.getInstance().openSession();
		//mapper의 namespace="memo", id="list" =>memo.list
		//         namespace="guestbook" id="list" =>guestbook.list
		//namespace가 다르면 id가 같아도 된다. 단,이땐 namespace.id해야된다.
		List<GuestBookDTO> list=null;
		if(searchkey.equals("name_content")) {//이름+내용
			list=session.selectList("gbListAll", "%"+search+"%");
		}else {
			//mybatis의 method에는 2개이상의 parameter를 전달할 수 없음
			//따라서 dto객체난 HashMap등을로 값을 묶어서 보내야함
			Map<String,String> map=new HashMap<>();
			//map.put(key,value)
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList",map);
		}
		
		//줄바꿈 및 특수문자 처리기능 추가
		for(GuestBookDTO dto : list) {
			String content=dto.getContent();
			//태그 문자 처리
			content=content.replace("<", "&lt;");
			content=content.replace(">", "&gt;");
			//줄바꿈 처리
			content=content.replace("\n", "<br>");
			//공백 2문자이상 처리
			content=content.replace("  ", "&nbsp;&nbsp;");
			
			//키워드 색상 처리
			if(!searchkey.equals("name")) {//이름으로만 검색시 제외
				content=content.replace(search,
						"<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}

	//방명록 insert
	public void gbInsert(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("gbInsert", dto);
		session.commit();
		session.close();
	}//gbInsert

	//비밀번호 체크(idx:게시물 번호, passwd 사용자의 입력값)
	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=MybatisManager.getInstance().openSession();
		GuestBookDTO dto=new GuestBookDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		//레코드가 1개가 리턴
		int count=session.selectOne("guestbook.passwdCheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}//passwdCheck()
	
	//게시물의 상세정보 (idx: 게시물 번호)
	public GuestBookDTO gbDetail(int idx) {
		GuestBookDTO dto=new GuestBookDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("gbDetail", idx);
		session.close();
		return dto;
	}//gbDetail()

	//게시물 수정
	public void gbUpdate(GuestBookDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("guestbook.gbUpdate", dto);
		session.commit();
		session.close();
	}

	//게시물 삭제
	public void gbDelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("guestbook.gbDelete", idx);
		session.commit();
		session.close();	
	}
}