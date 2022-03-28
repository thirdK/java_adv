package homework;

import java.util.Scanner;

public class Hw21 {
/*
121.
what is the meaning of Immutable in the context of String?

Immutable이란 불변한다는 것이며 String객체는 값을 수정하는게 불가능하므로 Immutable하다고 한다.

122.
why a String object is considered immutable in java?

자바의 문자열 객체를 생성하는 방법은 두 가지가 있다.

첫 번째는 String str = "aaa";
문자열 리터럴을 사용하여 참조변수 str을 초기화하는 것

두 번째는 String str = new String("aaa"); 
일반적으로 new를 사용하여 객체를 생성하여 str이 참조하게 하는 방법이다.

여기서 문자열 리터럴이 저장되는 공간은 메모리의 힙영역의 문자열 상수풀(String Constant pool)이다.
리터럴 값은 한번 만들어지면 동일한 값을 같는 변수들이 생겼을때 기존에 생성된 리터럴을 가리키게 되는데 예를들어
String str1 = "aaa";
String str2 = "aaa";
String str3 = new String("aaa");
str1과 str2는 단순히 같은 값을 저장하는 객체가 아니라 "aaa"가 저장되어 있는 하나의 공간을
동일하게 가리키고 있는것이다.(같은 참조값을 가지고있다.)
str3은 직접 객체를 만들어서 참조하게 하므로 str1,str2와 다른 참조값을 갖는다.

동일한 데이터를 갖는경우 같은 객체를 참조하게하면 메모리를 아끼는 이점이 있지만 
문제는 참조하고 있는 곳의 데이터를 변경하게되면 그곳을 참조하던 모든 참조변수들의 값이 변경된다 
그렇기때문에 String은 Immutable한 속성을 갖을 수 밖에 없고 값을 변경하거나 '+'연산자를 사용하여 
문자열을 합치는등의 수정을 하려고 하면 내부적으로는 완전히 새로운 문자열객체를 생성하여 참조하게 한다. 

123.
How many objects does following code create?
String s1 = "HelloWorld";
String s2 = "HelloWorld";
String s3 = "HelloWorld";

1개만 생성된다.

124.
How many ways are there in Java to create a String object?
2가지가 있다.
1. 문자열 리터럴을 사용하는 경우
	String str = "aaa";
2. 객체를 생성하는 경우
	String str = new String("aaa");
	
125.
문제가 안보임...

126.
What is String interning?
문자열 리터럴을 사용할 때 문자열 상수풀 내부에 저장된 데이터 중 
동일한 문자열이 있는지 검색하고 있다면 같은곳을 참조하게하는 것 (없다면 새로 생성하고 그곳의 참조값을 반환함)

127.
Why Java uses String literal concept?
동일한 데이터를 가진 객체를 여러개 만들 필요가 없으므로 메모리를 절약할 수 있다

128.
What is the basic difference between a String and StringBuffer
String은 Immutable이므로 수정을 하려면 매번 새로운 인스턴스를 만든다. 자주 변경되는 값에는 효율이 떨어진다.
StringBuffer는 Mutable 값 변경이 가능하다. 즉, 하나의 인스턴스로 수정이 가능하다.

129.
How will you create an immutable class in java?
수정 불가능하게 만드면 되므로 class의 맴버는 상수로 만들고 접근제어자도 private 사용한다.
맴버에 접근하여 값을 변경하는 메서드를 만들지 않는다.(setter같은 메서드)
값을 읽어오는 메서드는 괜찮다(getter같은 메서드)

130.
What is the use of toString() method in java?
toString()메서드는 모든 객체의 조상인 Object클래스에 정의되어있는 메서드이다. 해당 객체가 가지고있는
정보를 반환하는 메서드인데 몇몇 클래스에서는 Override하여 객체의 값을 반환하는 기능을 하기도 한다.

 */
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("n = ");
		int n = sc.nextInt();
		System.out.print("k = ");
		int k = sc.nextInt();
		
		System.out.println("n을 1로 만드는 최소 횟수는 " + solution(n,k) + " 회 이다.");
		
	}
	
	static public int solution(int n, int k) {
		int cnt = 0;
		while(n != 1) {
			cnt++;
			if(n%k == 0) {
				n /= k;
				continue;
			}
			n--;
		}
		return cnt;
	}
}
