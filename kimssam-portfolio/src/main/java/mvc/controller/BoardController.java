package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;


public class BoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		
		System.out.println(RequestURI);
		System.out.println(contextPath);
		
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			
			rd.forward(request, response);
		}
	}
	
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		int pageNum = 1;
		int limit = LISTCOUNT; //5 상수
		
		//페이지 번호가 있으면
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		boardlist = dao.getBoardList(pageNum);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardlist", boardlist);
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		
		int total_record = dao.getListcount(items, text);
		
		boardlist = dao.getBoardList(pageNum, limit, items, text);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);


		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record/limit;
		}else {
			total_page = (total_record/limit)+1;
		}
		
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
	}
}
