//
//  팰린드롬수.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/07/31.
//

import Foundation

//백준 1259번
//어떤 단어를 뒤에서부터 읽어도 똑같다면 그 단어를 팰린드롬이라고 한다.
func 팰린드롬수() {
    outer: while true {
        let input = Int(readLine()!)!
        if input == 0 { break outer }
        print(check(number: input))
    }
    
    func check(number: Int) -> String {
        let string = String(number)
        var result = "yes"
        for index in 0...string.count/2 {
            if string[index] != string[string.count-index-1] {
                result = "no"
                break
            }
        }
        return result
    }
}

extension String {
  subscript(_ index: Int) -> Character {
    return self[self.index(self.startIndex, offsetBy: index)]
  }
}


/*풀이 복기
문제를 잘 읽자... 뒤에 붙는 0도 제거하는 구문을 필요 없이 넣어서 계속해서 틀림
 푸는데 최소 15분 걸리는 문제들인 만큼 문제를 잘 읽는게 굉장히 중요하다
 문제를 파악하는데 최소 3~5분의 시간은 투자하자!!
 */

func 팰린드롬수_2() {
    outer: while true {
        let input = Int(readLine()!)!
        if input == 0 { break outer }
        print(check(number: input))
    }
    
    func check(number: Int) -> String {
        let stringNumber = String(number)
        if stringNumber == String(stringNumber.reversed()) {
            return "yes"
        }
        return "no"
    }
}
/*
 Recfactoring
 String의 index에 대해서 subscript를 통해서 접근을 하였지만 접근하지 않고 푸는 다른 풀이 방법을 찾아보자!!
 
 해당 문제를 indeex로 접근하여서 앞과 뒤를 비교해줄 필요가 없다!!
 뒤집어도 똑같으면 된다!!

*/
