package com.hk.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hk.config.SqlMapConfig;
import com.hk.dtos.LoginDto;

import oracle.net.aso.f;

public class LoginDao extends SqlMapConfig{
	
	private String namespace="com.hk.muser.";
	
	public boolean insertUser(LoginDto dto) {
		int count=0;
		SqlSession sqlSession=null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.insert(namespace+"insertUser",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	
	public boolean idChk(String id) {
		String idbool = null;
		boolean isS=false;
		SqlSession sqlSession=null;
		
		sqlSession=getSqlSessionFactory().openSession(true);
		//파라미터로 가져온 id와 같은 id가 db안에 있으면 해당아이디 반환
		idbool=sqlSession.selectOne(namespace+"idChk", id);
		//반환된값이 없으면(중복되지않으면)true
		//중복되면 false
		if(idbool==null) {
			isS=true;
		}
		
		return isS;
	}
	
	public LoginDto getLogin(String id, String password) {
		Map<String, String> map= new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		LoginDto dto=null;
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(namespace+"login",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dto;
	}
	
	public LoginDto getUserInfo(String id) {
		LoginDto dto =new LoginDto();
		SqlSession sqlSession= null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			dto=sqlSession.selectOne(namespace+"userInfo",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return dto;
	}
	
	public boolean updateUserInfo(LoginDto dto) {
		int count =0;
		SqlSession sqlSession =null;
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(namespace+"userUpdate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	
	public boolean deleteUserInfo(String id) {
		int count=0;
		SqlSession sqlSession=null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(namespace+"userDelete",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	
	public List<LoginDto> allUserInfo() {
		List<LoginDto> list = new ArrayList<>();
		SqlSession sqlSession= null;
		
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			list=sqlSession.selectList(namespace+"allUserList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list.toString());
		return list;
	}
	
	public boolean updateRoleInfo(String id,String role) {
		int count =0;
		SqlSession sqlSession =null;
		Map<String, String> map = new HashMap<>();
		map.put("m_id", id);
		map.put("m_role", role);
		try {
			sqlSession=getSqlSessionFactory().openSession(true);
			count=sqlSession.update(namespace+"roleUpdate",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return count>0?true:false;
	}
	
}
