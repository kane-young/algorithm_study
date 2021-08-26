//
//  MakeOne.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/26.
//

import Foundation

//다이나믹 프로그래밍
//나동빈 문제 "1로 만들기"
func makeOne(_ number: Int) -> Int {
  var array = Array(repeating: 0, count: 30001)
  
  for i in 2...number+1 {
    array[i] = array[i-1] + 1
    
    if i % 2 == 0 {
      array[i] = min(array[i], array[i / 2] + 1)
    } else if i % 3 == 0 {
      array[i] = min(array[i], array[i / 3] + 1)
    } else if i % 5 == 0 {
      array[i] = min(array[i], array[i / 5] + 1)
    }
  }
  return array[number]
}

// 처음에는 5로 나누기, 3로 나누기, 2로 나누기, 1을 빼기 순서대로 하는 것이 숫자를 빠르게 줄이는 길이라고 생각했다
