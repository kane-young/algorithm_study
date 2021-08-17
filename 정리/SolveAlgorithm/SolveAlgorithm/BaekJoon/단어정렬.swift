//
//  단어정렬.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/07/31.
//

import Foundation

//백준 1181번

//길이가 짧은 것 부터
//길이가 같으면 사전 순으로
func 단어정렬() {
    let number = Int(readLine()!)!
    var array = (1...number).map { _ in readLine()! }
    array = Array(Set(array))
    array.sort{
        if $0.count != $1.count {
            return $0.count < $1.count
        } else {
            return $0 < $1
        }
    }
    for word in array {
        print(word)
    }
}

