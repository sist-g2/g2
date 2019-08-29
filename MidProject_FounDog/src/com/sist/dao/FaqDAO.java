package com.sist.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.Board_FAQVO;

public class FaqDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<Board_FAQVO> faqListData(Map map){
		List<Board_FAQVO> list = new ArrayList<Board_FAQVO>();
		SqlSession session=ssf.openSession();
		list=session.selectList("faqListData",map);
		session.close();
		return list;
	}
}
