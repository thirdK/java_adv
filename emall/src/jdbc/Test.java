package jdbc;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class Test {
	public static void main(String[] args) {
		String test = "/";
		StringTokenizer st = new StringTokenizer(test, "/");
		
		if(!st.hasMoreElements()) {
			System.out.println("없어");
		}
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
		
	}
}
