//
//  크레인인형뽑기게임.swift
//  Programmers
//
//  Created by 이영우 on 2021/07/22.
//

import Foundation

func 크레인인형뽑기게임(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board: [[Int]] = board
    var basket: Stack = Stack()
    
    func rotateArray(_ num: Int) {
        for i in 0..<board.count {
            if board[i][num-1] != 0 {
                basket.push(board[i][num-1])
                board[i][num-1] = 0
                return
            }
        }
    }
    
    for move in moves {
        rotateArray(move)
    }
    return basket.result
}


fileprivate struct Stack {
    var array: [Int] = []
    var result = 0
    
    mutating func push(_ num: Int) {
        if let last = array.last {
            if num == last {
                array.removeLast()
                result += 2
                return
            }
        }
        self.array.append(num)
    }
    
    mutating func pop() {
        array.removeLast()
    }
}
