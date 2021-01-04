package review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import review.dto.ReviewDTO;
import sqlmap.MybatisManager;

public class ReviewDAO {
	public List<ReviewDTO> getList(String searchkey, String search){
		
		SqlSession session=MybatisManager.getInstance().openSession();
		List<ReviewDTO> list=null;
		if(searchkey.equals("name_content")) {
			list=session.selectList("rvListAll", "%"+search+"%");
		}else {
			Map<String,String> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("rvList",map);
		}

		for(ReviewDTO dto : list) {
			String content=dto.getContent();
			content=content.replace("<", "&lt;");
			content=content.replace(">", "&gt;");
			content=content.replace("\n", "<br>");
			content=content.replace("  ", "&nbsp;&nbsp;");
			
			if(!searchkey.equals("name")) {
				content=content.replace(search,
						"<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}

	public void gbInsert(ReviewDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("rvInsert", dto);
		session.commit();
		session.close();
	}

	public boolean passwdCheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=MybatisManager.getInstance().openSession();
		ReviewDTO dto=new ReviewDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		int count=session.selectOne("review.passwdCheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}
	
	public ReviewDTO gbDetail(int idx) {
		ReviewDTO dto=new ReviewDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("rvDetail", idx);
		session.close();
		return dto;
	}

	public void gbUpdate(ReviewDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("review.rvUpdate", dto);
		session.commit();
		session.close();
	}

	public void gbDelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("review.rvDelete", idx);
		session.commit();
		session.close();	
	}
}