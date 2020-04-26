package common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.CAns;
import post.model.vo.MarkPost;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.login")
public class LoginMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		ArrayList<Post> allHPost = new PostService().selectAllHPost(); // 모든 게시글 좋아요순
		ArrayList<String> markMemList = new PostService().selectMarkMem(loginId); // 관심회원 목록
		ArrayList<PostComment> allpc = new PostService().selectAllpc(); // 모든 댓글목록
		ArrayList<CAns> allca = new PostService().selectAllca(); // 모든 답글목록
		ArrayList<Media> postImg = new PostService().selectAllPostImg(); // 모든 프사,게시글사진
		ArrayList<MarkPost> mpList = new PostService().selectAllmp(loginId); // 관심글목록
		ArrayList<Post> nList = new PostService().selectcmnotice();// 공지사항 불러오기
		ArrayList<Post> newList = new PostService().selectcmnew();// 최신글 불러오기
		ArrayList<Post> hotList = new PostService().selecthot(); // 인기글 불러오기
		
		String page = "";
		if(allHPost != null && markMemList != null && allpc != null && allca != null && postImg != null) {
			request.setAttribute("allHPost", allHPost);
			request.setAttribute("markMemList", markMemList);
			request.setAttribute("allpc", allpc);
			request.setAttribute("allca", allca);
			request.setAttribute("postImg", postImg);
			request.setAttribute("mpList", mpList);
			request.setAttribute("nList", nList);
			request.setAttribute("newList", newList);
			request.setAttribute("hotList", hotList);
			page = "views/main/loginmain.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "메인 조회에 실패!");
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
