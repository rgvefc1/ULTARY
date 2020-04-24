package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{ //울타리 회원가입, 로그인, 비밀번호변경
	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		
		String value ="";
		
		//name 에 들어올수있는건? 회원가입, 로그인, 비밀번호변경 에 사용. 뷰에 있는 네임태그값 말하는것! 
		if(name != null && (name.equals("password") || name.equals("fine_newPwd") || name.equals("passwordcheck")|| name.equals("fine_newPwd_Confirm"))) {
			//내가 네임으로 받아온 값이 널이 아니면서 뒤의 이름 세개 중 하나면서 비어있지 않아야함
			
			value = getSha512(super.getParameter(name)); //암호화된 스트림이 반환되서 담김, 아래에 다시 메소드 만들어주기.
		}else {
			value = super.getParameter(name);
		}
		return value;
	}
	
	public static String getSha512(String userPwd) { 
		String encPwd = null; //암호화될 비번 담을 변수
		
		MessageDigest md =null; //MessageDigest가 필요함 java.security 안에 있음
		
		try {
			md = MessageDigest.getInstance("SHA-512"); //어떤 알고리즘을 사용할 것인지 ? 샤512 방식으로 하겠다.
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);  
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}
	
	
}
