package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import post.model.service.PostService;
import post.model.vo.PostComment;

/**
 * Servlet implementation class CommentInsertServelt
 */
@WebServlet("/insertComment.tl")
public class CommentInsertServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		int range = Integer.parseInt(request.getParameter("range"));
		int alkind = 1;
		String pNic = request.getParameter("pNic");
		
		PostComment pc = new PostComment();
		pc.setMemberid(writer);
		pc.setcContent(content);
		pc.setPostNum(pNum);
		pc.setcRange(range);
		
		String allink = "/cmdetail.po?pno="+pNum;
		int result = new PostService().insertAlert(allink, writer, alkind, pNic);
		
		
		ArrayList<PostComment> list = new PostService().insertComment(pc);
		
		if(result == 0) {
			request.setAttribute("msg", "알람창 추가 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
