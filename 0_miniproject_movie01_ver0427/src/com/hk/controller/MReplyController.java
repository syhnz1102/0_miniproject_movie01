package com.hk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hk.daos.ReplyDao;
import com.hk.dtos.ReplyDto;

@WebServlet("/MReplyController.do")
public class MReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("하이잉");
		String command=request.getParameter("command");
		ReplyDao dao = new ReplyDao();
		if(command.equals("addRate")) {
			//받아와야할 값
			//seq은 자동생성되니 필요없고
			//id, title, (content=null), rate,
			
			//여기서 title값에 유의 title값은 중복된 값이 많을 수 있으므로(이름이 같은 영화)
			//title+감독명으로 한다.
			//감독명+title로 한다
			//나중에 영화명으로 정보 빼올때는 substring으로 |뒤에껄 가져온다.
			//내 페이지에 뜨게 할 때는?
			
			//먼저 chkRate실행 후 true/false에 따라 add/update 결정
			
			String mid=request.getParameter("mid");
			String mtitle=request.getParameter("mtitle");
			String mdirector=request.getParameter("mdirector");
			String mpubdate=request.getParameter("mpubdate");
			String mnaverrate=request.getParameter("mnaverrate");
			String msubtitle=request.getParameter("msubtitle");
			String mactor=request.getParameter("mactor");
			String mlink=request.getParameter("mlink");
			String mimg=request.getParameter("mimg");
			String mkeyword=request.getParameter("mkeyword");
			
//			int rate=Integer.parseInt(request.getParameter("rate"));
			int rate=Integer.parseInt((request.getParameter("rate")==null?"1":request.getParameter("rate")));
			System.out.println("id:"+mid);
			System.out.println("title:"+mtitle);
			System.out.println("rate:"+rate);
			System.out.println("director:"+mdirector);

			String chkTitle = dao.chkRate(new ReplyDto(mtitle,mid,mdirector));
			
			if(chkTitle==null) {//평점이 등록 안되어있다면
				boolean isS = dao.addRate(new ReplyDto(mtitle,mid,rate,mdirector,mpubdate,mnaverrate,msubtitle,mactor,mlink,mimg));//평점등록
				if(isS) {//성공시
					System.out.println("평점 등록 성공");
				}
			}else {//평점이 등록 되어있으면
				boolean isS = dao.updateRate(new ReplyDto(mtitle,mid,rate,mdirector));
					System.out.println("평점 업데이트 성공");
			}
			
			
		}else if(command.equals("addComment")) {
			//얘는 인서트가 아닌 업데이트 개념
			//받아와야할 값
			//seq은 자동생성되니 필요없고
			//id, title, content, rate,
			System.out.println("ㅎㅇ");
			String mid=request.getParameter("id");
			String mtitle=request.getParameter("title");
			String mdirector=request.getParameter("director");
			String content=request.getParameter("content");
			boolean isS = dao.updateComment(new ReplyDto(mtitle,mid,content,mdirector));
			if(isS) {
				System.out.println("코멘트 업데이트 성공");
			}else {
				System.out.println("코멘트 업데이트 실패");
			}
			
		}else if(command.equals("getReply")) {
		
			//평점이 이미 있는 영화인지에 대한 if문
			String id=request.getParameter("mid");
			String title=request.getParameter("mtitle");
			String director=request.getParameter("mdirector");
	//		int rate=Integer.parseInt(request.getParameter("rate"));
	//		int rate=Integer.parseInt((request.getParameter("rate")==null?"1":request.getParameter("rate")));
			System.out.println("id:"+id);
			System.out.println("title:"+title);
	//		System.out.println("rate:"+rate);
			System.out.println("director:"+director);
			String chkTitle = dao.chkRate(new ReplyDto(title,id,director));
			
			//true-false만 반환하는 경우
//			if(chkTitle==null) {//평점이없다면 코멘트란 출력
//				System.out.println("첫평점등록");
//				PrintWriter pw=response.getWriter();
//				pw.print(true);
//			}else {//평점이 이미 있다면 출력
//				System.out.println("평점이미있음");
//				PrintWriter pw=response.getWriter();
//				pw.print(false);
//			}
			
			if(chkTitle==null) {//평점이없다면 그대로 출력
				System.out.println("평점 등록되어있지 않음 -> 출력안합니다");
				PrintWriter pw=response.getWriter();
				pw.print(false);
			}else {//평점이 이미 있다면 평점을 출력
				
//				평점이 이미 있다면 코멘트 유무도 확인?
				System.out.println("평점이미있음 -> 출력합니다!");
				int rate =dao.selectRate(new ReplyDto(title,id,director));
				PrintWriter pw=response.getWriter();
				pw.print(rate);
			}
		}else if(command.equals("myPage")) {
			String id = request.getParameter("id");
			List<ReplyDto> list= dao.getMyMovie(id);
			request.setAttribute("list", list);
			System.out.println(list);
			System.out.println("mypage갑시동");
			dispatch("user_mypage.jsp", request, response); 
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
