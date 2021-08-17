//
//  타겟넘버.swift
//  Programmers
//
//  Created by 이영우 on 2021/08/12.
//

import Foundation

func 타겟넘버(_ numbers: [Int], _ target: Int) {
    var count = 0
    
    func DFS(index: Int, sum: Int) {
        if index + 1 == numbers.count && sum == target {
            count += 1
            return
        }
        
        guard index + 1 < numbers.count else { return }
        
        DFS(index: index+1, sum: sum + numbers[index + 1])
        DFS(index: index+1, sum: sum - numbers[index + 1])
    }
    
    DFS(index: -1, sum: 0)
    
    print(count)
}

//DFS로 간단하게 풀 수 있는 문제들
//하나의 number씩 더할 때마다 왼쪽에 + / 오른쪽에 - 라고 생각하고 dfs하면서 target과 같으면? count += 1하고 return
//하도록 재귀함수를 짜면 매우 쉽게 문제를 해결할 수 있다!!
