package jdbc;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class Test {
	public static void main(String[] args) {
		String test = "asdf.jsp/a2.jsp/";
		StringTokenizer st = new StringTokenizer(test, "/");
		
		System.out.println(st.nextToken());
		System.out.println(st.nextToken());
		
	}
}
