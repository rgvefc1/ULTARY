package trust.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trust.model.service.MatchingService;
import trust.model.vo.TrustPost;

/**
 * Servlet implementation class UpdateTpServlet
 */
@WebServlet("/updateTp.tu")
public class UpdateTpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tpnum = Integer.parseInt(request.getParameter("tpnum"));
		
		int result  = new MatchingService().removetp(tpnum);
		
		if(result > 0) {
			response.sendRedirect("TpostView.tu");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage/jsp");
			request.setAttribute("msg", "리뷰수정 실패");
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
