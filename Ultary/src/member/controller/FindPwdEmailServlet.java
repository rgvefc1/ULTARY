package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdEmailServlet
 */
@WebServlet("/findPwdEmail.mem")
public class FindPwdEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디, 이메일로 비밀번호 찾기
		
		//아이디 받아오기
		String memberId = request.getParameter("userId");
		System.out.println("FindPwdEmailServlet 서블릿에서 뽑은 userId :"+memberId);
		
		//email 받기
		String email = request.getParameter("email");
		System.out.println("FindPwdEmailServlet 서블릿에서 뽑은 email :"+email);
		
		//디비에서 아이디와 비번이 일치하는 회원이 있는지만 확인.
		int findPwdMember = new MemberService().findPwdMember(memberId, email);
		
//		String page = null;
		
		if(findPwdMember > 0) {
//			page ="WebContent/views/main/findMember/newPwdForm.jsp";
//			request.setAttribute("memberId", memberId);
//			request.setAttribute("email", email);
			
			PrintWriter out = response.getWriter();
			out.append("success");
			out.flush();
			out.close();
			
			System.out.println("FindPwdEmailServlet 서블릿에서 확인하는 기존 아이디 있으면 1=>"+findPwdMember);
		
		}else {
			PrintWriter out = response.getWriter();
			out.append("fail"); ////회원정보가 없으면 없다고 알려주기
			out.flush();
			out.close();
			
			System.out.println("FindPwdEmailServlet 서블릿에서 확인하는 기존 아이디 없으면 0 =>"+findPwdMember);
		}
		
//		RequestDispatcher view = request.getRequestDispatcher(page);
//		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
