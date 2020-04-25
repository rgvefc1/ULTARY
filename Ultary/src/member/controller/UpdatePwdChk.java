package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdChk
 */
@WebServlet(urlPatterns = "/updatePwdChk.do", name="UpdatePwdChk")
public class UpdatePwdChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdChk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이페이지 현재 비밀번호를 가져와서 디비에있는 패스워드랑 비교
		String password = request.getParameter("password");
		System.out.println("암호화 되어있니???"+password);
		HttpSession session = request.getSession();
		Member sessionMember = (Member)session.getAttribute("loginUser");
		Member b = new Member(sessionMember.getMemberId(), password);
		
		int result = new MemberService().pwdUpdateChk(b);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			System.out.println("UpdatePwdChk 서블릿에서 확인하는 기존 비번 일치함 있음 =>"+result);
			out.append("success");
			
		}else {
			System.out.println("UpdatePwdChk 서블릿에서 확인하는 기존 비번 불일치  =>"+result);
			out.append("fail");
		}
		out.flush();
		out.close();
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
