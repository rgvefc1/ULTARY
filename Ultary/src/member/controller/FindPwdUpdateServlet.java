package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdUpdateServlet
 */
@WebServlet("/findPwdUpdate.mem")
public class FindPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//업데이트할 멤버 정보1
		String memberId1 = request.getParameter("memberId1");
		String email = request.getParameter("email");
		System.out.println("FindPwdUpdateServlet 에 아이디1과 이메일 들어오는지?  "+ memberId1 + " "+ email);
		
		//업데이트할 멤버 정보2
		String memberId2 = request.getParameter("memberId2");
		String pwquery = request.getParameter("pwquery");
		String pwqans = request.getParameter("pwqans");
		System.out.println("FindPwdUpdateServlet 에 아이디2와 질문, 질문답이 들어오는지?  "+ memberId2 + " "+ pwquery +" "+pwqans);
		
		//새 비밀번호
		String newPassword = request.getParameter("fine_newPwd_Confirm");
		System.out.println("FindPwdUpdateServlet 에 새 비밀번호가 들어오는지?"+newPassword);
		
		//업데이트 1
		int result1 = new MemberService().findPwdUpdate1(memberId1, email, newPassword);
		
		//업데이트 2
		int result2 = new MemberService().findPwdUpdate2(memberId2, pwquery, pwqans, newPassword);
		
		if(result1 > 0 || result2 > 0) { // 업데이트 성공시
			System.out.println("새 비밀번호 업데이트 성공이면 1 =>"+ result1);
			System.out.println("새 비밀번호 업데이트 성공이면 1 =>"+ result2);
			response.sendRedirect("views/main/main.jsp"); //메인으로
		} else { //업데이트 실패시
			request.setAttribute("msg", "새 비밀번호 설정 실패");
			
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
