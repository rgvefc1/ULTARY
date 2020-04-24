package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import common.wrapper.EncryptWrapper;

/**
 * 				울타리!!!
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter(
		servletNames = { //아래 메소드 들에 있는 비번 파라미터들이 암호화 됩니다.
				"FindPwdUpdateServlet", 
				"insertMemberServlet", 
				"LoginServlet"
		})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
    	System.out.println("울타리 EncryptFilter(암호화필터) 작동");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest hsr = (HttpServletRequest)request;
		
		EncryptWrapper ew = new EncryptWrapper(hsr);
		
		// pass the request along the filter chain
		chain.doFilter(ew, response);
		//이다음에 서블릿에 있는 이름 맵핑까지 끝내야 암호래퍼 끝남.
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
