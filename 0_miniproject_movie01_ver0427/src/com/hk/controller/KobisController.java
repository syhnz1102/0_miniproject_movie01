package com.hk.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import sun.misc.Perf.GetPerfAction;


@WebServlet("/KobisController.do")
public class KobisController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command=request.getParameter("command");
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
			request.setAttribute("movieNm",movieNm);
			request.setAttribute("listResult",listResult);
			dispatch("movieList.jsp",request,response);
		}else if(command.equals("movieDetail")) {
		
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch=request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
