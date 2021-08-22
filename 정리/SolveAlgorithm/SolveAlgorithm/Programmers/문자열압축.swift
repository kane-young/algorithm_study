//
//  문자열압축.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/22.
//

import Foundation

func repressString(_ s: String) -> Int {
    var answerArr: [Int] = [Int]()
    var splitCount: Int = 0 //String을 나누는 값
    
    while splitCount <= s.count / 2 {
        var x = 0 //splitCount로 나눈 s의 인덱스 값
        var count = 1 //몇번 반복되는지
        var pre = ""
        var answer = ""
        splitCount += 1
        
        while x <= s.count {
            let remainder = s.suffix(s.count - x)
            let prefix = remainder.prefix(splitCount)
            if pre == prefix {
                count += 1
                x += splitCount
                continue
            }
            
            if count > 1 {
                answer += "\(count)\(pre)"
            } else {
                answer += pre
            }
            
            pre = String(prefix)
            count = 1
            x += splitCount
        }
        
        answer += String(s.suffix(s.count - (x-splitCount)))
        answerArr.append(answer.count)
    }
    return answerArr.min()!}
