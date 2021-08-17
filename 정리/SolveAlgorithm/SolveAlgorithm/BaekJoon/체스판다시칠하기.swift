//
//  체스판다시칠하기.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/07/27.
//

import Foundation

//백준 1018번
func 체스판다시칠하기() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let row = input[0]
    let col = input[1]

    let board = (0..<row).map { _ in readLine()!.map{ String($0) }}
    var result = 64
    
    for i in 0...row-8 {
        for j in 0...col-8 {
            result = min(compare(row: i, column: j), result)
        }
    }
    
    func compare(row: Int, column: Int) -> Int {
        var whiteCount = 0
        var blackCount = 0
        
        for i in row..<row+8 {
            for j in column..<column+8 {
                if (i+j) % 2 == 0 {
                    if board[i][j] != "W" {
                        whiteCount += 1
                    } else {
                        blackCount += 1
                    }
                } else {
                    if board[i][j] != "B" {
                        whiteCount += 1
                    } else {
                        blackCount += 1
                    }
                }
            }
        }
        
        return whiteCount > blackCount ? blackCount : whiteCount
    }
    
    print(result)
}

/* 해당 문제의 포인트

브루트 포스 알고리즘 : 모든 경우를 대입해서 탐색하고 하나씩 해독하는 방법

일단 문제를 제대로 읽어야 했다... 8X8칸 으로 생각하고 결과 값을 도출해야되는데 계속 다르게 생각했다

8x8칸에서 가장 왼쪽 상단의 색을 Black, White 둘 중 어느 것도 가능하기에

두 가지 분기로 나눈 후에 풀어야 된다

경우의 수가 어떤 것이 있는지만 알면 아주 쉽게 구현할 수 있는 문제다

알아가는 포인트

let board = (0..<row).map { _ in readLine()!.map{ String(%0) }}
위와 같이 여러 줄의 input을 받아올 때, for문을 돌리기 보다는 위처럼 고차함수를 활용하자

*/
