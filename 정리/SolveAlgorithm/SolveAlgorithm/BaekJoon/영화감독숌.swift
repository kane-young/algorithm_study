//
//  영화감독숌.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/08/03.
//

import Foundation

//백준 1436번
//연속 숫자 666이 들어간 수 중에서 n번째로 작은 수를 찾는 문제
func 영화감독숌() {
    let input = Int(readLine()!)!
    var count = 0
    var currentNumber = 665
    
    var isSuccessed: Bool = true
    
    while isSuccessed {
        currentNumber += 1
        if String(currentNumber).contains("666") {
            count += 1
        }
        if input == count {
            isSuccessed = false
        }
    }
    print(currentNumber)
} //해당 문제 백준에서 시간 초과 발생

/* 시간 초과에 대한 고찰
 현재 풀이 방법의 경우 목표 수를 달성할 때까지 1씩 더한다. 목표를 달성할 경우 해당 숫자를 print
 */

func 영화감독숌2() {
    let input = Int(readLine()!)!
    var count = 0
    var currentNumber = 666
    
    while true {
        var copy = currentNumber
        var sixCount = 0
        
        while copy != 0 {
            if copy % 10 == 6 {
                sixCount += 1
            } else {
                sixCount = 0
            }
            
            if sixCount == 3 {
                count += 1
                break
            }
            copy /= 10
        }
        
        if input == count {
            print(currentNumber)
            break
        }
        
        currentNumber += 1
    }
}

//String(currentNumber).contains("666") 이 굉장히 높은 시간복잡도를 가지고 있음을 알 수 있다
//O(n)의 시간복잡도 n=글자의 길이
//https://developer.apple.com/documentation/swift/string/2893238-contains
//https://demian-develop.tistory.com/m/30 (Swift 시간복잡도에 대해 정리해 놓은 블로그)
