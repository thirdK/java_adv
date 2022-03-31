package homework;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Stack;

/*
1. 얼음틀 크기를 입력 받는다. N*M 2차원 배열을 생성하고 입력 받은 값에 맞게 0,1로 채운다.

2. 배열의 처음부터 마지막까지 반복문을 돌려서 탐색한다.
	-> 값이 0이면 dfs로 인접한 0을 모두 1로 바꿔준다. (방문한 배열의 값을 1로 바꾸어 중복 탐색을 막는다.) 
	-> 카운트한다. 

3. dfs는 stack / 재귀 2가지 방법으로 구현가능하다.

	Stack사용
	넘어온 인덱스에 저장된 값이 0이면 해당 인덱스를 stack에 push하고  count를 증가시킨다. 
		a. pop하여 꺼낸 인덱스에 인접한 칸들의 값을 탐색한다.
		b. 값이 0이면 아직 탐색하지 않는 칸이므로 stack에 push한다. 
		c. 모든 인접칸을 확인하여 push가 끝났으면 stack에 들어있는 객체를 pop한다. (pop할때마다 해당 인덱스 값을 1로 변경하자)
		인접칸에 0이 없을때까지 a,b,c반복 -> 0이 없으면 알아서 스택이 비워진다.
	
	-> 노드가 아니라 2차원배열이므로 상하좌우 좌표처럼 이동해야 할거 같다.
	-> 아니면 4방향으로 link필드를 가지는 노드를 만들어야되는데... 하면 안될거 같다

3-1. Stack으로 우선 풀고 재귀로 시도해보자

4. count를 할지 list.size()를 이용할지는 구현을 해봐야할거 같다.
	->해보니까 stack은 카운팅이 생각보다 쉽게 가능하고 재귀는 힘들어서 size()를 이용하게됨

 */

public class Hw24 {
	static int[][] arr;
	static int cnt;					//Stack풀이는 cnt를 사용
	static ArrayList<Integer> result = new ArrayList<Integer>();

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("얼음판 크기를 띄어 쓰기로 구분하여 입력 (n m) : ");
		int n = sc.nextInt();
		int m = sc.nextInt();
		sc.nextLine();	//버퍼에서 개행문자 비워줌
		arr = new int[n][m];

		for (int i = 0; i < n; i++) {	
			String line = sc.nextLine();
			for (int j = 0; j < m; j++) {
				arr[i][j] = line.charAt(j) - '0';	//입력받은 값 2차원 배열에 정수로 채우기
			}
		}
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				if (arr[i][j] == 0) { 				//여기서 0을 발견해야 dfs()메소드가 실행됨
					dfs(i, j);						//Stack을 이용한 풀이
					
					result.add(dfsR(i,j));			//재귀를 이용한 풀이
				}
			}
		}
		System.out.println(cnt);	//Stack 결과
		System.out.println(result.size());	//재귀 결과
	}


	//재귀를 이용한 풀이
	static int dfsR(int x, int y) {	
		int[][] udlr = { { 0, -1 }, { 0, 1 }, { -1, 0 }, { 1, 0 } };
		
		arr[x][y] = 1;	//접근하면 중복탐색을 피하기 위해 1로 변경
		for (int i = 0; i < 4; i++) { // 연결(인접)가능한 배열은 4방향 이므로 4회반복
			int newX = x + udlr[i][0];// 좌, 우
			int newY = y + udlr[i][1];// 상, 하
			if (newX >= 0 && newX < arr.length && newY >= 0 && newY < arr[0].length) {
				if(arr[newX][newY]==0) {
					dfsR(newX, newY);
				}
			}
		}
		return 1234;	//의미 없는 숫자다.
		//ArrayList result에 아무 값이나 넣고 size로 답을 뽑을거라서 아무값이나 반환해도됨
		//반환하는 값보다 반환을 하는것에 의미가 있음
	}

//===========================================================================================================
	//Stack을 이용한 풀이
	static void dfs(int x, int y) {
		Stack<XY> stack = new Stack<XY>(); 		// XY클래스 하단 참고

		int[][] udlr = { { 0, -1 }, { 0, 1 }, { -1, 0 }, { 1, 0 } };
		// 상하좌우 좌표이동을 x, y 인덱스번호로 표현하기위해 2차원 배열로 만듬

		stack.push(new XY(x, y)); 				// 우선 메서드에 들어왔다는건 0이라는 뜻이기 때문에 stack에 push하며 cnt를 증가시킨다.
		cnt++;

		while (!stack.isEmpty()) { 				// 스택이 공백이 될때까지 반복
			XY tmp = stack.pop(); 				// pop()하여 꺼내고
			arr[tmp.x][tmp.y] = 1; 				// 꺼낸 객체의 x,y를 인덱스로 사용하여 배열 arr의 요소 값을 바꾼다.

			for (int i = 0; i < 4; i++) { 		// 연결(인접)가능한 배열은 4방향 이므로 4회반복
				int newX = tmp.x + udlr[i][0];	// 좌, 우
				int newY = tmp.y + udlr[i][1];	// 상, 하

				// 배열의 범위를 벗어나면 index예외 발생하므로 조건문으로 걸러줌
				if (newX >= 0 && newX < arr.length && newY >= 0 && newY < arr[0].length) {
					if (arr[newX][newY] == 0)
						stack.push(new XY(newX, newY));
				}
			}
		}

	}
}

//stack에 x,y좌표를 저장하기 위해 XY클래스를 만듬
class XY {
	int x;
	int y;

	public XY(int x, int y) {
		this.x = x;
		this.y = y;
	}
}