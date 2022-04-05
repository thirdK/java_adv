package homework;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

/*
N*M 크기의 직사각형 형태의 미로에서 괴물을 피해 탈출한다.
1,1에서 시작하며 미로의 출구는 N,M이다. -> 배열은 0,0부터이다.
한칸씩 이동하며 괴물이 있는 곳은 피해서 이동한다.(괴물이 있으면 0, 없으면 1)
미로는 반드시 탈출할 수 잇는 형태로 제시된다. 탈출하기 위한 최소 칸의 수를 구해라

2차원 배열 탐색문제 (dfs, bfs 개념 활용)

1.  N M 을 입력받는다.
	- N*M크기의 배열을 생성한다.
2. 미로의 정보를 0과 1로 입력받는다.(공백없어야 하며 시작과 끝은 항상 1이여야함)
	- 입력 순서에 맞게 배열을 0과 1로 채운다.
3. 최소 이동 칸의 수를 출력한다.
	- 탐색한다. (bfs 활용)
	- bfs는 Queue를 사용한다.(자바에서 제공하는 Queue는 인터페이스이고 queue를 구현한 LinkedList의 인스턴스를 사용한다.)
	- 최소 탐색 경로 수만 결과로 얻어낸다. 
		-> 이부분은 같은 크기의 배열을 만들어서 시작지점부터의 이동거리를 저장하거나
		-> 이동하는 칸 숫자를 1씩 증가시켜야 할듯
 */

public class Hw26 {
	static int n, m;
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("n과 m을 입력하세요 (n m) : ");
		n = sc.nextInt();
		m = sc.nextInt();
		sc.nextLine();
		int[][] arr = new int[n][m];
		
		for(int i=0; i<arr.length; i++ ) {	//배열 0/1 입력받고
			String tmp = sc.nextLine();
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = tmp.charAt(j)-'0';
			}
		}
		System.out.println(bfs(arr));
	}
	
//================================================================================================
	static int bfs(int[][] arr) {
		Queue<XY2> q = new LinkedList<XY2>();	//queue만들고
		int[][] udlr = {{0,-1},{0,1},{-1,0},{1,0}};	//상하좌우
		int[][] result = new int[n][m];		//시작위치와의 거리를 저장할 배열
		result[0][0]=1;	//시작위치부터 세어야 하니까 1 저장
		
		
		//시작위치부터 enqueue -> dequeue -> 주변칸 탐색 -> 조건에 맞으면 전부 enqueue -> dequeue -> 주변칸 탐색
		//반복
		q.add(new XY2(0,0));	//enqueue
		while(!q.isEmpty()) {	//공백 Queue가 될때까지
			XY2 xy = q.poll();	//dequeue
			arr[xy.x][xy.y] = 0;//탐색한 칸은 0으로 마킹
			
			for(int i=0; i<4; i++) {	// 상하좌우 조건을 반복문 안에서 확인함
				int tmpX = xy.x + udlr[i][0];
				int tmpY = xy.y + udlr[i][1];		
				
				if(tmpX >= 0 && tmpX < n && tmpY >= 0 && tmpY <m) {//배열의 범위를 벗어나면 안되므로 걸러줌
					if(arr[tmpX][tmpY] == 0) continue;	//0이면 이미 탐색했거나 괴물이 있는 곳이므로 건너뜀
					else {
						result[tmpX][tmpY] = result[xy.x][xy.y] + 1;//result배열에 현재위치의 거리를 저장(누적)
						q.add(new XY2(tmpX, tmpY));	//조건에 맞는 칸이면 enqueue
					}
				}
			}
		}
		return result[n-1][m-1];	//결과 배열의 마지막 출구지점의 숫자를 반환
	}
}

class XY2{
	int x;
	int y;
	XY2(int x, int y) {
		this.x=x;
		this.y=y;
	}
}















