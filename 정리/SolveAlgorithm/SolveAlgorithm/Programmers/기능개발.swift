//
//  기능개발.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/20.
//

import Foundation

func developeFunction(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var dates: [Int] = []
    var result: [Int] = []
    for i in 0..<progresses.count {
        let n = ceil(Double(100 - progresses[i]) / Double(speeds[i]))
        dates.append(Int(n))
    }
    
    outer: while !dates.isEmpty {
        let first = dates.removeFirst()
        var returnCount: Int = 1
        
        for date in dates {
            if first < date {
                result.append(returnCount)
                continue outer
            } else {
                returnCount += 1
                dates.removeFirst()
            }
        }
        
        if dates.isEmpty {
            result.append(returnCount)
        }
    }
    
    return result
}

//어렵지 않게 푼 문제 40분만에 solve한 것 같다
//queue 자료구조를 생각하고 풀면 쉽게 풀 수 있는 것 같다

//남은 작업일 수를 기준으로
//앞에 작업일 수가 더 크면? 뒤에꺼도 같이 배포
//앞에 작업일 수가 더 작으면? 앞에꺼만 배포
