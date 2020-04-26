package trust.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Media;
import member.model.vo.Member;
import member.model.vo.Pet;
import post.model.service.PostService;
import trust.model.service.MatchingService;

/**
 * Servlet implementation class DetailMatchServlet
 */
@WebServlet("/DetailMatch.tu")
public class DetailMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailMatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member sessionMember =(Member)session.getAttribute("loginUser");
		String loginUser = sessionMember.getMemberId();
	
		ArrayList<Pet> PetList = new MemberService().loginPet(loginUser);
		ArrayList<Media> MediaList = new MemberService().loginMedia(loginUser);
		
		
		String memberid = request.getParameter("memberid");
		String petNum = "";
		if(request.getParameter("petNum")!= null) {
			petNum = request.getParameter("petNum");
		} else {
			petNum = null;
		}

		Member m = new MatchingService().DetailView(memberid);
		
		String page = null;
		if(m != null) {
			Pet pet = new MatchingService().DetailPet(loginUser);
			Media proImg = new PostService().selectProImg(memberid); 
			if(pet != null) {
				page="views/trustMatch/matching03.jsp";
				request.setAttribute("m",m);
				request.setAttribute("MediaList", MediaList);
				request.setAttribute("PetList", PetList);
				request.setAttribute("pet",pet);
				request.setAttribute("petNum", petNum);
				request.setAttribute("proImg", proImg);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg","pet이 없습니다");
			}
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg","실패! DetailMatchServelt 확인");
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
