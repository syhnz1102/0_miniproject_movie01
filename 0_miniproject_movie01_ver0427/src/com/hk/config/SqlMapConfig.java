package com.hk.config;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	//밑의 변수 안에 Configuration.xml을 넣어서 작업에 쓰기위해 준비하는 작업
	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource="com/hk/sql/Configuration.xml";
		
		try {
			//밑에 reader 대신 inputstream을 사용해도 된다.
			Reader reader=Resources.getResourceAsReader(resource);
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return sqlSessionFactory;
	}
	
}
