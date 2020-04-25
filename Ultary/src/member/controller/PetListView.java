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
import member.model.vo.Pet;

/**
 * Servlet implementation class PetListView
 */
@WebServlet("/Pet.view")
public class PetListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetListView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberid = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		ArrayList<Pet> PetList = new MemberService().loginPet(memberid);
		ArrayList<Media> MediaList = new MemberService().loginMedia(memberid);
		
		String page = "";
		String msg = "";
	
		if(PetList != null && MediaList != null) {
			request.setAttribute("MediaList", MediaList);
			request.setAttribute("PetList", PetList);
			RequestDispatcher view = request.getRequestDispatcher("views/myPage/memberUpdate.jsp");
			view.forward(request, response);
		} else {
				page= "views/common/errorPage.jsp";	
				msg= "수정저장에 실패헀습니다.";
				request.setAttribute("msg", msg);
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
