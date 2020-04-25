package member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
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

/**
 * Servlet implementation class DeletePet
 */
@WebServlet("/delete.pet")
public class DeletePet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int petNum = Integer.parseInt(request.getParameter("petNum"));
		String webname = request.getParameter(request.getParameter("webname"));
		
		int result = new MemberService().deletePet(petNum);
		
		if(result > 0) {
			File failedFile = new File(request.getSession().getServletContext().getRealPath("/") + "uploadFiles/" + webname);
			failedFile.delete();
		} else {
			request.setAttribute("msg", "반려동물 삭제실패!");
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
