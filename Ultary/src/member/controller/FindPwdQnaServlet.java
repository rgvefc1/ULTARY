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
 * Servlet implementation class FindPwdQnaServlet
 */
@WebServlet("/findPwdQna.mem")
public class FindPwdQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아이디, 비번질문, 비번질문답으로 비밀번호 찾기
	
		//아이디 받아오기
		String memberId = request.getParameter("userId");
		System.out.println("FindPwdQnaServlet 서블릿에서 뽑은 userId :"+memberId);
		
		//비번질문 받기
		int pwquery = Integer.parseInt(request.getParameter("pwquery"));
		System.out.println("FindPwdQnaServlet 서블릿에서 뽑은 pwquery :"+pwquery);
		
		//비번 답 받기
		String pwqans = request.getParameter("pwqans");
		System.out.println("FindPwdQnaServlet 서블릿에서 뽑은 pwqans :"+pwqans);
		
		
		//디비에서 아이디와 비번질문, 비번질문답이 일치하는 회원이 있는지만 확인.
		int findPwdQnaMember = new MemberService().findPwdQnaMember(memberId, pwquery, pwqans);
		
		if(findPwdQnaMember > 0) {
			PrintWriter out = response.getWriter();
			out.append("success");
			out.flush();
			out.close();
			
			System.out.println("FindPwdEmailServlet 서블릿에서 확인하는 기존 아이디 있으면 1=>"+findPwdQnaMember);
		}else {
			PrintWriter out = response.getWriter();
			out.append("fail"); ////회원정보가 없으면 없다고 알려주기
			out.flush();
			out.close();
			
			System.out.println("FindPwdEmailServlet 서블릿에서 확인하는 기존 아이디 없으면 0 =>"+findPwdQnaMember);
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
