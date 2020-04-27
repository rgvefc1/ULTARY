package trust.controller;

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
import trust.model.service.MatchingService;
import trust.model.vo.TrustReview;

/**
 * Servlet implementation class MemberDetailServlet
 */
@WebServlet("/MemberDetail.tu")
public class MemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = request.getParameter("memberid");
		String loginId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		Member m = new MatchingService().MemberDetail(memberid);
		
		String page= "";
		if(m != null) {
			ArrayList<Member> markList = new MemberService().selectMarkMember(loginId);
			ArrayList<TrustReview> trList = new MatchingService().trReview(memberid);
			Media proImg = new PostService().selectProImg(memberid); 
			ArrayList<Media> allImg = new PostService().selectAllproimg();
			
			page="views/trustMatch/matching04.jsp";
			request.setAttribute("m",m);
			request.setAttribute("mark", markList);
			request.setAttribute("trList", trList);
			request.setAttribute("proImg", proImg);
			request.setAttribute("allImg",allImg);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg","해당 member 없음");
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
