//
//  직사각형에서탈출.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/07/29.
//

import Foundation

//백준 1085번
func 직사각형에서탈출() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    print(calculateLength(x: input[0], y: input[1], width: input[2], height: input[3]))
    
    func calculateLength(x: Int, y: Int, width: Int, height: Int) -> Int {
        let minXLength: Int
        let minYLength: Int
        if x > (width / 2) {
            minXLength = width - x
        } else if x < (width / 2) {
            minXLength = x
        } else {
            minXLength = width / 2
        }
        
        if y > (height / 2) {
            minYLength = height - y
        } else if y < (height / 2) {
            minYLength = y
        } else {
            minYLength = height / 2
        }
        
        return minXLength > minYLength ? minYLength : minXLength
    }
}

func 직사각형에서탈출_2() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    print(min(input[0], input[1], input[2]-input[0], input[3]-input[1]))
}

/*
 문제 분석하기
 알고리즘 분류 : 수학, 기하학
 
 한수는 지금(x,y)에 있다. 직사각형은 각 변이 좌표축에 평행하고, 왼쪽 아래 꼭짓점은(0,0), 오른쪽 위 꼭짓점은 (w,h)에 있다. 직사각형의 경계선까지 가는 거리의 최솟값을 구하는 프로그램을 구하시오
 
 2단계 문제 답지 않게 많이 쉬웠던 문제
 
 잘못 생각해서 abs()를 통해 절댓값을 사용하면 안된다는 것을 다들 알 것 같다
 
 풀이를 줄일 수 있는 방법은?
 위와 같이 간단하게 min(_, _, _, _)를 통해서 줄일 수 있다
 민망해질 정도로 줄어든다...
 
 최솟값이라는 것, 최댓값 이라는 것을 인지하자!
 */
