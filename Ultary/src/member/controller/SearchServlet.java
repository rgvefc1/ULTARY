package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.CAns;
import post.model.vo.PageInfo;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class SearchMemServlet
 */
@WebServlet("/search.mem")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int searchselect = Integer.parseInt(request.getParameter("searchselect"));
		String searchtext = request.getParameter("searchtext");
		
		PostService service = new PostService();
		
		String page = "";
		//////////////////////////게시글 검색////////////////////////
		int categorynum = 0; // 카테고리 번호
		String searchcon = "ct"; // 검색조건
		
		if(searchselect == 1) {
			ArrayList<Member> list = new MemberService().selectMember(searchtext);
			ArrayList<Media> allPro = service.selectAllproimg();
			
			if(list != null) {
				page = "views/main/mainmemsearch.jsp";
				request.setAttribute("Mlist", list);
				request.setAttribute("allPro", allPro);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "멤버 조회에 실패!");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else if(searchselect == 2){
			
		int listCount = service.getSearchListCount(searchtext,categorynum,searchcon);
		
		int currentPage;			// 현재 페이지
		int pageLimit = 10;				// 한 페이지에 표시될 페이징 수
		int maxPage;				// 전체 페이지 중에서 마지막 페이지 찐막
		int startPage;				// 페이징 된 페이지 중 시작 페이지
		int endPage;				// 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 10;				// 한 페이지에 보일 게시글 수
		
		currentPage = 1;  // 페이지 이동은 url에 기술 할꺼임 list.bo?currentPage=~
		if(request.getParameter("currentPage") != null) {   // currentPage값이 존재 한다면
			currentPage = Integer.parseInt(request.getParameter("currentPage")); 
		}
		
		maxPage = (int)((double)listCount / boardLimit + 0.9);
		
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) -1) * pageLimit + 1;
		
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,pageLimit,maxPage,startPage,endPage,boardLimit);
		
		ArrayList<Post> list = service.selectSearchList(searchtext,categorynum,searchcon,currentPage,boardLimit);
		
		ArrayList<Media> AllMList = service.selectAllMList();
		
		ArrayList<Media> ProList = service.selectAllproimg();
		
		ArrayList<PostComment> pclist = service.selectAllpc();
	
		ArrayList<CAns> calist = service.selectAllca();

			if(list != null) {
				page ="views/community/search_result.jsp";
				request.setAttribute("pi", pi);
				request.setAttribute("searchtext", searchtext);
				request.setAttribute("lcount", listCount);
				request.setAttribute("cnum", categorynum);
				request.setAttribute("searchcon", searchcon);
				request.setAttribute("list",list);
				request.setAttribute("AllMList", AllMList);
				request.setAttribute("ProList", ProList);
				request.setAttribute("pclist", pclist);
				request.setAttribute("calist", calist);
			}else {
				page="views/common/errerPage.jsp";
				request.setAttribute("msg", "검색에 실패");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			 view.forward(request, response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
