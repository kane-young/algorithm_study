//
//  trucOnBridge.swift
//  SolveAlgorithm
//
//  Created by 이영우 on 2021/08/18.
//

import Foundation

//프로그래머스 다리를 지나는 트럭
//스택과 큐 문제
struct Truck {
    let weight: Int
    var time: Int
}

func truckOnTheTruck(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truck: [Int] = truck_weights
        var queue: [Truck] = []
        var time: Int = 0
        
        while !queue.isEmpty || !truck.isEmpty {
            time += 1
            guard let first = queue.first else {
                queue.append(Truck(weight: truck.removeFirst(), time: 0))
                continue
            }
            
            if first.time >= bridge_length {
                queue.removeFirst()
            }
            if let truckFirst = truck.first {
                let totalWeight = queue.reduce(0, { $0 + $1.weight })
                if totalWeight + truckFirst <= weight {
                    queue.append(Truck(weight: truck.removeFirst(), time: 0))
                }
            }
            
            queue = queue.map {
                return Truck(weight: $0.weight, time: $0.time + 1)
            }
            
        }
        return time - 1
}

//1차 문제 풀이 solve 1시간
//너무 오래걸렸다...
//문제 풀이방법을 알지만 디테일한 구현에서 막히고 있다...
//더 체계적으로 하는 방법을 세우자

func truckOnTheTruck2(_ 다리길이:Int, _ 무게제한:Int, _ 트럭들:[Int]) -> Int {
    var truck: [Int] = 트럭들
    var queue: [Truck] = []
    var time: Int = 0
    
    while !queue.isEmpty || !truck.isEmpty {
        time += 1
        queue = queue.map {
            return Truck(weight: $0.weight, time: $0.time + 1)
        }//진행
        if let first = queue.first {
            if first.time >= 다리길이 {
                queue.removeFirst()
            }
        }//도착
        if let truckFirst = truck.first {
            let totalWeight = queue.reduce(0, { $0 + $1.weight })
            if totalWeight + truckFirst <= 무게제한 {
                queue.append(Truck(weight: truck.removeFirst(), time: 0))
            }
        }//진행
    }
    return time
}
//프로그래머스의 경우 전달인자를 전부 _ 처리하기 때문에 매개변수 이름을 내가 마음대로 바꿔도된다
