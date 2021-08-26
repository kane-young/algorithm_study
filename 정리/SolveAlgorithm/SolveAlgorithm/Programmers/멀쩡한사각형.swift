//
//  멀쩡한사각형.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/26.
//

import Foundation

//프로그래머스 멀쩡한사각형 문제
func normalSquare(_ w: Int, _ h: Int) -> Int64 {
  var a = w
  var b = h
  while a%b != 0 {
    let x = a%b
    a = b
    b = x
  }
  return Int64(w*h-(w+h-b))
}

func normalSquare2(_ w: Int, _ h: Int) -> Int64 {
  func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
      return a
    } else {
      return gcd(b, a % b)
    }
  }
  
  return Int64((w * h) - (w + h - gcd(8, 12)))
}
//전체 칸의 갯수 - 가로 - 세로 + (가로, 세로 최대공약수)

func normalSquare3(_ w: Int, _ h: Int) -> Int64 {
  var answer: Int64 = 0
  let width = Double(w)
  let height = Double(h)
  
  for x in 1..<w {
    let y = ceil(height / width * Double(x))
    answer += Int64(height - y)
  }
  
  return answer * 2
}
