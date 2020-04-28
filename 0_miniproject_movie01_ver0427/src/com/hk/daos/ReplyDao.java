package com.hk.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hk.config.SqlMapConfig;
import com.hk.dtos.ReplyDto;

public class ReplyDao extends SqlMapConfig{
	private String namespace="com.hk.mreply.";
	
	public boolean addRate(ReplyDto dto) {
		int count=0;
		SqlSession sqlSession =null;
		try {
			sqlSession =getSqlSessionFactory().openSession(true);
			count = sqlSession.insert(namespace+"insertRate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	
	public String chkRate(ReplyDto dto) {
		String chkTitle="";
		SqlSession sqlSession =null;
		try {
			sqlSession =getSqlSessionFactory().openSession(true);
			chkTitle = sqlSession.selectOne(namespace+"chkRate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return chkTitle;
	}
	
	public boolean updateRate(ReplyDto dto) {
		int count=0;
		SqlSession sqlSession =null;
		try {
			sqlSession =getSqlSessionFactory().openSession(true);
			count = sqlSession.insert(namespace+"updateRate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	
	public int selectRate(ReplyDto dto2) {
		SqlSession sqlSession =null;
		int rate=0;
		try {
			sqlSession =getSqlSessionFactory().openSession(true);
			rate =sqlSession.selectOne(namespace+"selectRate",dto2);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return rate;
	}
	
	public boolean updateComment(ReplyDto dto) {
		int count=0;
		SqlSession sqlSession =null;
		try {
			sqlSession =getSqlSessionFactory().openSession(true);
			count = sqlSession.insert(namespace+"updateComment",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	
	public List<ReplyDto> chkComment(ReplyDto dto){
		SqlSession sqlSession=null;
		List<ReplyDto> list =new ArrayList<>();
//		Map<String, String> map = new HashMap<>();
//		map.put("m_title", mtitle);
//		map.put("m_director", mdirector);
		try {
			System.out.println("다오입니다");
			System.out.println(dto);
			sqlSession =getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(namespace+"chkComm",dto);
			System.out.println("쿼리실행후 list에 담았습니다");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return list;
	}
}
