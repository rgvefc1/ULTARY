package trust.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import member.model.vo.Pet;
import trust.model.service.MatchingService;
import trust.model.vo.TrustPost;

/**
 * Servlet implementation class DetailTpVIewSurvlet
 */
@WebServlet("/DetailTp.tu")
public class DetailTpVIewSurvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailTpVIewSurvlet() {
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
	
		String memberid = request.getParameter("memberid");
		Member m = new MatchingService().DetailView(memberid);
		
		int tpnum = Integer.parseInt(request.getParameter("tp"));
		
		String page = null;
		if(m != null) {
			Pet pet = new MatchingService().DetailPet(loginUser);
			if(pet != null) {
				TrustPost tp = new MatchingService().tpview(tpnum);
				if(tp!=null) {
					page="views/trustMatch/postview.jsp";
					request.setAttribute("m",m);
					request.setAttribute("pet",pet);
					request.setAttribute("tp", tp);
				}
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
