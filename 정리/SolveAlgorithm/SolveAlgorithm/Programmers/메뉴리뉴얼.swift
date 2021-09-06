//
//  메뉴리뉴얼.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/09/06.
//

import Foundation

func renewalMenu(_ orders:[String], _ course:[Int]) -> [String] {
    var result: [String] = []
    
    func exec(_ orders: [String], target count: Int) -> [String] {
        var dic: [String: Int] = [:]
        
        for order in orders {
            let order = order.map{ String($0) }.sorted().reduce("", {$0 + $1})
            
            let x = combination(order, target: count)
            for a in x {
                if let _ = dic[a] {
                    dic[a]! += 1
                } else {
                    dic[a] = 1
                }
            }
        }
        
        let maxCount = dic.max {
            $0.value < $1.value
        }?.value
        
        if let maxCount = maxCount, maxCount <= 1 {
            return []
        }
        
        let keys: [String] = dic.filter {
            $0.value == maxCount
        }.map {
            $0.key
        }
        
        return keys
    }
    
    func combination(_ string: String, target count: Int) -> [String] {
        var result: [String] = []
        let data = string.map { String($0) }
        var visit: [Bool] = Array(repeating: false, count: data.count)
        
        func combi(_ index: Int, _ nowCombi: [Int]) {
            
        }
        func comb(data: [String], curInd: Int, curCnt: Int, targetCnt: Int, answer: String) {
            if curCnt == targetCnt {
                result.append(answer)
            }
            
            for i in curInd..<data.count {
                if !visit[i] {
                    visit[i] = true
                    comb(data: data, curInd: i, curCnt: curCnt + 1, targetCnt: targetCnt, answer: answer + data[i])
                    visit[i] = false
                }
            }
        }
        comb(data: data, curInd: 0, curCnt: 0, targetCnt: count, answer: "")
        
        
        return result
    }
    
    for count in course {
        result.append(contentsOf: exec(orders, target: count))
    }
    
    return result.sorted()
}
