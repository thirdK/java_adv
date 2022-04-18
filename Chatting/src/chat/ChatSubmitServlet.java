package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String chatName = URLDecoder.decode(request.getParameter("chatName"), "UTF-8");
		String chatContent = URLDecoder.decode(request.getParameter("chatContent"), "UTF-8");

		if(chatName == null || chatName.equals("") || chatContent == null || chatContent.contentEquals("")) {
			//비어 있는지 확인한다.
			//비어 있다(오류가 발생하)면 0을 출력
			response.getWriter().write("0");
		}else {
			response.getWriter().write(new ChatDAO().submit(chatName, chatContent) + "");
			//비어있지 않다면 실제 DB와 연결하여 데이터를 저장시킨다.
			//이때 반드시 문자열 형태로 출력하기 위해 공백을 더해준다.
		}
	}
	//서블릿을 매핑하기 위해 web.xml에 매핑작업을 해준다.
}
