//
//  수찾기.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/23.
//

import Foundation

//1920번 수찾기 문제
func searchNumber() {
    let _ = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    let _ = Int(readLine()!)!
    let answerArray = readLine()!.split(separator: " ").map { Int($0)! }
    for element in answerArray {
        print(binarySearch(0, array.count - 1, element, array))
    }
}

func binarySearch(_ start: Int, _ end: Int, _ target: Int,_ array: [Int]) -> Int {
    if start > end {
        return 0
    }
    
    let mid = (start + end) / 2
    
    if array[mid] == target {
        return 1
    } else if array[mid] > target {
        return binarySearch(start, mid - 1, target, array)
    } else if array[mid] < target {
        return binarySearch(mid + 1, end, target, array)
    }
    return 0
}

//이분탐색의 간단한 예를 보여주는 문제이다
//mid에 -,+를 끝없이 해주는 재귀함수 형태이기 때문에 start, end가 서로 역전되지만 않으면 된다
//foundation 에서 제공되는 array.sort의 경우 nlogn의 시간복잡도를 가지는 것을 기억하자!
