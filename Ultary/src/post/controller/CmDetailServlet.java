package post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Media;
import member.model.vo.Member;
import post.model.service.PostService;
import post.model.vo.CAns;
import post.model.vo.Post;
import post.model.vo.PostComment;

/**
 * Servlet implementation class CmDetailServlet
 */
@WebServlet("/cmdetail.po")
public class CmDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String loginId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		PostService service = new PostService();
		
		Post post = service.selectPostDetail(pno); // 상세보기
		ArrayList<Media> fileList = service.selectphoto(pno); //상세보기
		ArrayList<PostComment> pclist = service.detailpclist(pno); // 게시글별 댓글 목록
		ArrayList<CAns> calist = service.detailcalist(pno);// 게시글별 답글 목록
		ArrayList<Media> proList = service.selectAllproimg(); // 프로필 사진 
		int checklike = service.checklike(pno,loginId); //좋아요 상태
		int checkmarkpost = service.checklikepost(pno,loginId); // 관심글 상태
		
		
		
		if(post != null && fileList != null && pclist != null && calist != null && proList != null) {
			request.setAttribute("post", post);
			request.setAttribute("fileList", fileList);
			request.setAttribute("pclist", pclist);
			request.setAttribute("calist", calist);
			request.setAttribute("proList", proList);
			request.setAttribute("checklike",checklike);
			request.setAttribute("checkmarkpost",checkmarkpost);
			request.getRequestDispatcher("views/community/cm_details.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "상세보기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
