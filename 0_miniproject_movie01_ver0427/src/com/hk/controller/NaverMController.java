package com.hk.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.set.SynchronizedSet;

import com.hk.daos.ReplyDao;
import com.hk.dtos.ReplyDto;
import com.sun.org.apache.bcel.internal.generic.DALOAD;

@WebServlet("/NaverMController.do")
public class NaverMController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.밑에꺼(키워드:주식)를 제이슨으로 내보내주는 쿼리
		//2.검색가능하게 해주기(검색어 이걸로 전환 (인코딩)필요 %EC%A3%BC%EC%8B%9D)
		String command=request.getParameter("command"); 
		if (command.equals("searchMovie")) {
			System.out.println("movieListR에서 영화목록을 보여줍니다");
			response.setContentType("text/json;charset=utf-8");
			
			String movieNm = request.getParameter("movieNm")==null?"주식":request.getParameter("movieNm");
			System.out.println(movieNm);
//			System.out.println("호이짜");
			String encodeResult=URLEncoder.encode(movieNm,"utf-8");
//			System.out.println(encodeResult);
			String clientId ="gAmPLfD6Yxi3ZwxoZ70V";
			String clientSecret = "4iJBiopPIt";
//			String apiUrl="https://openapi.naver.com/v1/search/movie.json?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&genre=1";
			// String apiUrl="https://openapi.naver.com/v1/search/movie.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&genre=1";
			
//			String apiUrl="https://openapi.naver.com/v1/search/movie.json?query="+encodeResult+"&display=100&start=1&genre=0";
			String apiUrl="https://openapi.naver.com/v1/search/movie.json?query="+encodeResult+"&display=100&start=1";
			
			System.out.println(apiUrl);
			URL url = new URL(apiUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {//br.readLine()가 널이 아닐때만 inputLine에 br.readLine()값 집어넣고 while문 실행
				sb.append(inputLine);
			}
			br.close();
			
//		request.setAttribute("sb",sb);
//		dispatch("movieListN.jsp",request,response);
			System.out.println(sb.toString());
			
			PrintWriter pw=response.getWriter();
			pw.print(sb.toString());
//        pw.print(br.toString());
			
		}else if (command.equals("searchMovieXml")) {
			response.setContentType("text/json;charset=utf-8");
			
			String movieNm = request.getParameter("movieNm")==null?"주식":request.getParameter("movieNm");
			System.out.println(movieNm);
//			System.out.println("호이짜");
			String encodeResult=URLEncoder.encode(movieNm,"utf-8");
//			System.out.println(encodeResult);
			String clientId ="gAmPLfD6Yxi3ZwxoZ70V";
			String clientSecret = "4iJBiopPIt";
//			String apiUrl="https://openapi.naver.com/v1/search/movie.json?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&genre=1";
//			 String apiUrl="https://openapi.naver.com/v1/search/movie.xml?query=%EC%A3%BC%EC%8B%9D&display=10&start=1&genre=0";
			
			String apiUrl="https://openapi.naver.com/v1/search/movie.xml?query="+encodeResult+"&display=100&start=1&genre=0";
			System.out.println(apiUrl);
			//밑의 두줄은 하나의 방 식
			URL url = new URL(apiUrl);//url객체에 url 주소를 담는 기능
			HttpURLConnection con = (HttpURLConnection)url.openConnection();//url객체의 주소를 요청해주는 기능
			
			con.setRequestMethod("GET");//url을 요청하며 get방식임을 전달(요청)한다
			con.setRequestProperty("X-Naver-Client-Id", clientId);//url을 요청하며 clientID을 전달(요청)한다 
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);//위와같다
			int responseCode = con.getResponseCode();//http응답의 상태코드를 요청후 받아와 저장한다. ex)404(에러),500(에러),200(정상호출)
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {//br.readLine()가 널이 아닐때만 inputLine에 br.readLine()값 집어넣고 while문 실행
				sb.append(inputLine);
			}
			br.close();
			
//		request.setAttribute("sb",sb);
//		dispatch("movieListN.jsp",request,response);
			System.out.println(sb.toString());
			
			PrintWriter pw=response.getWriter();
			pw.print(sb.toString());
//        pw.print(br.toString());
			
			
		}else if (command.equals("movieDetail")) {
			String movieNm = request.getParameter("keyword");
			System.out.println(movieNm);
			
			//row는 스크립트쪽에서 처리하기에 여기선 필요없다
//			String row = request.getParameter("row");
//			System.out.println(row);
			
			response.setContentType("text/json;charset=utf-8");
			String encodeResult=URLEncoder.encode(movieNm,"utf-8");

			String clientId ="gAmPLfD6Yxi3ZwxoZ70V";
			String clientSecret = "4iJBiopPIt";
						
			String apiUrl="https://openapi.naver.com/v1/search/movie.json?query="+encodeResult+"&display=100&start=1&genre=0";
			System.out.println(apiUrl);
			URL url = new URL(apiUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {//br.readLine()가 널이 아닐때만 inputLine에 br.readLine()값 집어넣고 while문 실행
				sb.append(inputLine);
			}
			br.close();
			
			System.out.println(sb.toString());
			
			PrintWriter pw=response.getWriter();
			pw.print(sb.toString());
		}else if(command.equals("movieListR")) {
			System.out.println("movieListR로 이동합니다");
			String movieNm=request.getParameter("movieNm");
			System.out.println(movieNm);
			request.setAttribute("movieNm", movieNm);
			dispatch("movieListR.jsp", request, response);
		}else if(command.equals("movieDetailR")) {
			System.out.println("movieDetailR로 이동합니다");
			String mtitle=request.getParameter("mtitle");
			String mid=request.getParameter("mid");
			String mdirector=request.getParameter("mdirector");
			String mpubdate=request.getParameter("mpubdate");
			String mrate=request.getParameter("mrate");
			String msubtitle=request.getParameter("msubtitle");
			String mactor=request.getParameter("mactor");
			String mlink=request.getParameter("mlink");
			String mimg=request.getParameter("mimg");
			String mkeyword=request.getParameter("mkeyword");
			
			String [] arr= {mtitle, mid, mdirector, mpubdate, mrate, msubtitle, mactor, mlink, mimg};
			
			ReplyDao dao =new ReplyDao();
			System.out.println(mtitle);
			System.out.println(mid);
			System.out.println(mdirector);
			System.out.println(mpubdate);
			System.out.println(mrate);
			System.out.println(msubtitle);
			System.out.println(mactor);
			System.out.println(mlink);
			System.out.println(mimg);
			System.out.println(mkeyword);
			List<ReplyDto> list = dao.chkComment(new ReplyDto(mtitle,mdirector));
			request.setAttribute("list", list);
			request.setAttribute("arr", arr);
			request.setAttribute("mkeyword", mkeyword);
			dispatch("movieDetailR.jsp", request, response);
		}
	}
        
        
        
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
