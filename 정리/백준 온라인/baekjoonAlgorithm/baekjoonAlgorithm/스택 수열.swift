//
//  스택 수열.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/08/08.
//

import Foundation

func 스택수열() {
    let input = Int(readLine()!)!
    
    var stack: [Int] = []
    var currentNumber = 0
    var result: [String] = []
    
    for _ in 0..<input {
        let number = Int(readLine()!)!
        
        if currentNumber < number {
            for i in currentNumber+1...number {
                stack.append(i)
                result.append("+")
                currentNumber = i
            }
        }
        
        if number == stack.last {
            _ = stack.popLast()
            result.append("-")
        } else {
            result = ["NO"]
        }
    }
    
    for index in result {
        if index == "NO" {
            print(index)
            break
        }
        print(index)
    }
}

//스택구조는 선입후출의 구조이기 때문에 만약에
//스택 제일 맨 위에 있는 last가 현재 수열에 나열하려고 하는 숫자보다 큰 경우 NO가 출력되게 하면 된다
//나머지는 전부 정상 작동한다
