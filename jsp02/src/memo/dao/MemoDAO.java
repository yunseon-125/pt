package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	
	public List<MemoDTO> listMemo(String searchkey, String search){
		//mybatis 실행 객체 생성
		SqlSession session=MybatisManager.getInstance().openSession();
		List<MemoDTO> list=null;
		try {
			if(searchkey.equals("writer_memo")) {//이름+메모로 검색
				list=session.selectList("memo.listAll",search);
				//search는 검색키워드
			}else {
				Map<String,String> map=new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				//입력매개변수는 1개만 전달할 수 있음
				list=session.selectList("memo.list", map);
			}//end else
			for(MemoDTO dto : list) {//치환기법을 list에 쓸 때는 for문을 씀
				String memo=dto.getMemo();
				memo=memo.replace("  ", "&nbsp;&nbsp;");//공백 문자 처리(스페이스2개변환)
				memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
				memo=memo.replace(">", "&gt;"); //Greater Than ~보다 크다
				//키워드에 색상 처리
				if(searchkey.equals("memo")) {
					if(memo.indexOf(search) != -1) {
						memo=memo.replace(search, 
								"<font color='red'>"+search+"</font>");
					}
				}
				dto.setMemo(memo);
			}
			
			//목록을 뽑을 때 selectList()를 쓴다.
			//memo.listAll => namespace.id
			//memo.xml에 저장될 sql문장을 실행시 활용
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) 
				session.close();//mybatis 객체 닫기
		}
		return list;
	}

	//memo insert
	public void insertMemo(MemoDTO dto) {
		//mybatis 실행 객체 생성
		SqlSession session=MybatisManager.getInstance().openSession();
		//태그 문자 처리
		//String memo=dto.getMemo();
		//memo=memo.replace("  ", "&nbsp;&nbsp;");//공백 문자 처리(스페이스2개변환)
//		memo=memo.replace("<", "&lt;"); //Less Than ~보다 작다
//		memo=memo.replace(">", "&gt;"); //Greater Than ~보다 크다
//		dto.setMemo(memo);
		
		session.insert("memo.insert", dto);//레코드 추가, insert메소드는
		//파라미터가 1개밖에 허용안한다.
		session.commit();//수동 커밋, mybatis는 자동커밋을 막았다.
		session.close();//mybatis 세션 닫기
	}//insertMemo()
	
	public MemoDTO viewMemo(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		MemoDTO dto=session.selectOne("memo.view", idx);
		//selectOne() 레코드 1개만 가져올 때
		//selectList() 레코드 2개 이상 가져올 때(목록을 가져올 때)
		session.close();
		return dto;
	}//viewMemo

	public void updateMemo(MemoDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("memo.update", dto);
		session.commit();//select가 아닌 경우는 수동커밋
		session.close();
	}

	public void deleteMemo(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("memo.delete", idx);
		session.commit();
		session.close();
		
	}
	
}
