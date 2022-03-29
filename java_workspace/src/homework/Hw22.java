package homework;

import java.util.Scanner;

/*
131.
StringBuilder -> StringBuffer -> String 
String보다는 Buffer를 사용하는 StringBuilder와 StringBuffer가 빠르다.
StringBuilder와 StringBuffer는 거의 동일한데 동기화의 유무에 따라 효율성의 차이가 있다.
일반적으로는 StringBuilder가 동기화에서는 StringBuffer가 효율이 좋다.

132.
예외처리란?
런타임오류가 발생할 여지가 있는 문장 중 코드로 처리가가능한 정도의 오류를 예외라고 한다.
이러한 예외들을 미리 대비해서 코드를 작성하여 비정상 적인 종료를 막는것을 예외처리라고 한다. 

133.
Checked와 Unchecked의 차이는?
RuntimeException 의 하위클래스를 unchecked 예외라고 하며 예외처리를 안해도된다.
(안해도 된다는것이지 예외가 발생하지 않는다는것은 아니다 
개발자가 실수를 해서 발생하는 예외들은 예상치 못하게 발생할 수 있다.)
Exception 의 하위클래스를 checked 예외라고 하며 반드시 예외처리를 해야한다.

134.
Error와 Exception클래스의 기본클래스는?
Error와 Exception클래스는 Throwable의 자식클래스이다.

135.
finally블록은?
try-catch문은 자바에서 예외처리를 할 때 사용하는데 finally를 선택적으로 사용할 수 있다.(try- catch -finally)  
try블록에 예외가 발생할것 같은 문장을 작성하며
catch블록은 예외가 발생했을때 이동하여 수행되는 문장을 작성한다
finally블록은 예외 유무와 관계없이 항상 실행되는 문장을 작성한다.

136.
finally 블록 사용이유?
예외 유무와 관계없이 항상 실행되야하는 문장이 있을때 사용한다.

137.
catch블록 없이 finally블록을 사용할 수 있는가?
try블록이 있다면 가능하다.

138.
catch블록은 항상 try블록 뒤에 넣어야 하는가?
그렇다. try에서 catch의 인자로 지정한 예외가 발생해야 catch문에 넘어간다.

139.
finally블록이 실행되지 않는 경우는?
finally블록이 실행되기 전에 프로그램이 종료되는 경우

140.
자바에서 예외 re-throw가 가능한가?
가능하다. 예외가 발생할 가능성이 있는 메서드에서 try-catch를 이용해 예외를 처리하고 
다시 throw를 이용해서 예외를 발생시키면 된다. 해당 메서드에서 예외를 던지므로 메서드를 정의할때
throws를 이용해서 예외를 선언해야한다.

 */

public class Hw22 {
	static int x=1, y=1;	//시작 좌표 (1,1)
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		
		System.out.print("사각형의 크기는 N*N입니다. N을 입력하세요 : ");
		int n = sc.nextInt();
		sc.nextLine();	//버퍼에서 개행문자 비워주기
		System.out.println("상(U), 하(D), 좌(L), 우(R)");
		System.out.print("이동 계획 입력 : ");
		
		for(String s : sc.nextLine().split(" ")) {	//입력받은 문자열 split으로 쪼개서 배열로 반환
			solution(n, s);
		}
		
		System.out.println(x + " " + y);
	}
	
	//매개변수로 받은 이동계획에 맞게 좌표값 수정해주는 메서드
	static void solution(int n, String token) {//n 사각형 크기, token 이동계획 1개씩 가져옴	
		switch(token) {
		case "U":
			if(y!=1) y--; //좌표가 1보다 작으면 안되므로
			return;
		case "D":
			if(y!=n) y++; //좌표가 최대크기(n)보다 크면 안되므로
			return;
		case "L":
			if(x!=1) x--;
			return;
		case "R":
			if(x!=n) x++;
			return;
		}
	}
}















