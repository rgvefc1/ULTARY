package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Media;
import post.model.service.PostService;
import post.model.vo.Post;

/**
 * Servlet implementation class PostWriteView
 */
@WebServlet("/postview.tl")
public class PostWriteView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWriteView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		Post p = new PostService().selectPost(pNum);
		ArrayList<Media> mList = new PostService().selectphoto(pNum);
		
		
		String page = "";
		if(p != null && mList != null) {
			page = "views/myUltary/postmodify.jsp";
			request.setAttribute("p", p);
			request.setAttribute("mList", mList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정 폼실행에 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
