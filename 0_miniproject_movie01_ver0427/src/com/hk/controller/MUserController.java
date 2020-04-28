package com.hk.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.codehaus.jackson.map.ObjectMapper;

import com.hk.daos.LoginDao;
import com.hk.dtos.LoginDto;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@WebServlet("/MUserController.do")
public class MUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command=request.getParameter("command");
		LoginDao dao = new LoginDao();
		HttpSession session =request.getSession();
		if(command.equals("searchMovie")) {
			String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");
			String itemPerPage=request.getParameter("itemPerPage")==null?"20":request.getParameter("itemPerPage");
			String movieNm = request.getParameter("movieNm")==null?"엽문":request.getParameter("movieNm");
			String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");
			String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");
			String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");
			String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");
			String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");
			String repNationCd=request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");
			String [] movieTypeCdArr = null;
			
			//발급키
			String key="ee27a84a2b1eba74150f10a20c97341a";
			//kobis오픈api rest client를 통해 호출
			KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
			
			String ListResponse = null;
			try {
				ListResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(ListResponse);
		//json 라이브러리를 통해 Handling
			ObjectMapper mapper=new ObjectMapper();
			HashMap<String, Object> listResult= mapper.readValue(ListResponse,HashMap.class);
			System.out.println(listResult.get("movieListResult"));
			request.setAttribute("listResult",listResult);
			dispatch("movieList.jsp",request,response);
		}else if(command.equals("regist")){
			response.sendRedirect("regist.jsp");
		}else if(command.equals("insertuser")){
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			
			boolean isS=dao.insertUser(new LoginDto(id,password,name,address,phone,email));
			if(isS) {
				request.setAttribute("msg","회원가입이 완료되었습니다." );
				dispatch("index.jsp", request, response);
			}else {
				request.setAttribute("msg","회원가입에 실패했습니다." );
				dispatch("error.jsp", request, response);
			}
		}else if(command.equals("idchk")) {
			response.setContentType("text/html;charset=utf-8");
			String id=request.getParameter("id");
			boolean isS = dao.idChk(id);
			PrintWriter pw=response.getWriter();

			if(isS) {
				pw.write("사용가능한 아이디입니다.");
			}else {
				pw.write("중복된 아이디 입니다.");
			}
		}else if(command.equals("loginform")) {
			response.sendRedirect("login.jsp");
		}else if(command.equals("login")) {
			String id= request.getParameter("id");
			String password= request.getParameter("password");
			LoginDto ldto = dao.getLogin(id, password);
//			System.out.println(ldto.toString()); //null이라 toString작업을 할 수 없기때문에 null pointer exception
			if(ldto==null||ldto.getM_id()==null) {
				request.setAttribute("msg", "아이디나 패스워드를 확인하세요!");
				dispatch("error.jsp", request, response);
			}else {
//				HttpSession session=request.getSession();
				
				session.setAttribute("ldto", ldto);
				session.setMaxInactiveInterval(10*60);//10*60초 =10분
				
				if(ldto.getM_role().toUpperCase().equals("ADMIN")) {
					response.sendRedirect("admin_main.jsp");
				}else {
					response.sendRedirect("user_main.jsp");
				}
			}
		}else if (command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}else if (command.equals("userinfo")) {
			String id= request.getParameter("id");
			LoginDto dto = dao.getUserInfo(id);
			request.setAttribute("dto", dto);
			dispatch("user_detail.jsp", request, response);
		}else if (command.equals("updateform")) { 
			String id = request.getParameter("id");
			LoginDto dto=dao.getUserInfo(id);
			request.setAttribute("dto", dto);
			dispatch("user_update.jsp", request, response);
		}else if (command.equals("userupdate")) { 
			String id = request.getParameter("id");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			System.out.println("호잇");
			boolean isS = dao.updateUserInfo(new LoginDto(id,address,phone,email));
			if(isS) {
				response.sendRedirect("MUserController.do?command=userinfo&id="+id);
			}else {
				request.setAttribute("msg", "정보 수정 실패!");
				dispatch("error.jsp", request, response);
			}
		}else if (command.equals("userdelete")) {
			String id=request.getParameter("id");
			boolean isS=dao.deleteUserInfo(id);
			if(isS) {
				request.setAttribute("msg","회원정보가 삭제되었습니다" );
				dispatch("index.jsp", request, response);
			}else {
				request.setAttribute("msg", "회원 삭제 실패!");
				dispatch("error.jsp", request, response);
			}
		}else if (command.equals("allUserList")) {
//			1.회원목록 표시
//			2.탈퇴회원과 활동회원 분류해서 표시(쿼리:orderby)
			System.out.println("ㅎㅇ");
			List<LoginDto> list =dao.allUserInfo();//어차피 다오안에서 list객체를 생성하기 때문에 new 없이 가능
			request.setAttribute("list", list);
			dispatch("admin_userlist.jsp", request, response);
		}else if (command.equals("roleForm")) {
			String id =request.getParameter("id");
			LoginDto dto=dao.getUserInfo(id);
			request.setAttribute("dto", dto);
			dispatch("admin_roleForm.jsp", request, response);
		}else if (command.equals("roleUpdate")) {
			String id =request.getParameter("id");
			String role =request.getParameter("role");
			boolean isS=dao.updateRoleInfo(id, role);
			if(isS) {
				response.sendRedirect("MUserController.do?command=allUserList");
			}else {
				request.setAttribute("msg", "등급 변경 실패!");
				dispatch("error.jsp", request, response);
			}
		}
		
	}

	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
