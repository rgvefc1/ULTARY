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
 * Servlet implementation class PostUpdate
 */
@WebServlet("/update.tl")
public class PostUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		String title = request.getParameter("title");
		int range = Integer.parseInt(request.getParameter("postRange"));
		String content = request.getParameter("postContent");
		int categorynum = Integer.parseInt(request.getParameter("categorynum"));
		
		Post p = new Post(pNum, title, content, range, categorynum);
		
		int result = new PostService().updatePost(p);
		
		if(result > 0) {
			response.sendRedirect("post.tl");
		} else {
			request.setAttribute("msg", "게시글 수정에 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
