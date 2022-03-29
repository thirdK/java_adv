package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")	//url 들어갈 이름을 WebServlet 어노테이션으로 명시

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {	// 생성자
    	super();			// 부모생성자 호출
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //Html에서 form의 method를 Get으로 설정하면 이곳
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String uid = request.getParameter("id"); //넘겨받은 값 중 "id"를 반환
		String upw = request.getParameter("password");
		String res = "<html><h3>User ID : " + uid + "</h3><br>"
				+ "<h3>User Password : " + upw + "</h3>"
				+ "</html>";
		//Servlet은 html을 자바에 끼워 넣는 느낌이다. 
		response.getWriter().print(res); //출력
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//Html에서 form의 method를 Post로 설정하면 이곳
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);	//post를 설정해도 결국 내부적으로는 get처리됨
	}

}
