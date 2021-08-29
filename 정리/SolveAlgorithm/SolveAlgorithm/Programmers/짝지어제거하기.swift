//
//  짝지어제거하기.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/29.
//

import Foundation

//프로그래머스 짝지어 제거하기 문제
func removePairs(_ s: String) -> Int {
  var stack = [String.Element]()
  
  for i in s {
    if stack.count > 0 && stack.last == i {
      stack.removeLast()
    } else {
      stack.append(i)
    }
  }
  
  return stack.count > 0 ? 0: 1
}
//지금 당장 비교해야되는 문자를 스택의 최상단에 저장해두고 계속해서 비교하는 과정을 담고 있다..
//너무 좋은 아이디어인 것 같다
