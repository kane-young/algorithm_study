//
//  File.swift
//  baekjoonAlgorithm
//
//  Created by 이영우 on 2021/08/05.
//

import Foundation

//백준 1654번 문제
func 랜선자르기() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let target: Int = input[1]

    let cables: [Int] = (0..<n).map{ _ in Int(readLine()!)! }
    let max = Int.max
    
    var result = 0

    for i in 1...max {
        var tempt = 0
        for cable in cables {
            tempt += cable / i
        }
        if tempt == target {
            if result < i {
                result = i
            }
        } else if tempt < target {
            break
        }
    }

    print(result)
}
//min으로 했을 경우 실패, max로 했을 경우는 시간초과가 발생한다
//제일 작은 랜선을 쓰지 않는다고 해도, 목표 랜선 갯수를 채울 수 있기 때문에 min은 적합하지 않다
//하지만 max까지 전부 계산하는 것은 옳지 않은 것인가?

//일단은 계산했을 때 target 랜선 갯수보다 적게 나오면 거기서부터는 목표에 도달할 수 없다는 것이기에 for문을 멈추자

func 랜선자르기2() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let target: Int = input[1]

    let cables: [Int] = (0..<n).map{ _ in Int(readLine()!)! }
    let min = cables.min()! / target
    let max = cables.reduce(0, { $0 + $1 }) / target
    var result = 0

    for i in min...max {
        var tempt = 0
        for cable in cables {
            tempt += cable / i
        }
        if tempt == target {
            if result < i {
                result = i
            }
        } else if tempt < target {
            break
        }
    }

    print(result)
}
//런타임 에러가 난다

func 랜선자르기3() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let number = input[0]
    let target: Int = input[1]

    var cables: [Int] = []
    for _ in 0..<number {
        let num = Int(readLine()!)!
        cables.append(num)
    }//입력//cable

    func check(_ num: Int) -> Bool {
        var sum = 0
        for cable in cables {
            if cable < num {
                continue
            }
            sum += cable / num
        }
        return sum >= target
    }

    func search() {
        var left = 0, right = Int.max
        
        while left+1 < right {
            let pivot = (right+left) / 2
            if check(pivot) {
                left = pivot
            } else {
                right = pivot
            }
        }
        print(left)
    }

    search()
}

//0부터 Int.max까지를 이진탐색을 통해서 빠르게 탐색한다
//이를 통해서 시간초과를 해결해준다
//솔직히 왜 여기서 입력 값들 중에서 최대 값을 Int.max 대신 넣어주면 틀리는지에 대해서 잘 모르겠다...
