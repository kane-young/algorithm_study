//
//  올리브영1번.swift
//  Programmers
//
//  Created by 이영우 on 2021/08/17.
//

import Foundation


func transCoordinate(_ l: Int, _ r: Int, _ t: Int, _ b: Int, _ x: Int, _ y: Int) -> (Int, Int) {
    return (l + x % (r - l), b + y % (t - b))
}

func 올리브영1번(_ x: [Int], _ y: [Int], _ r: [Int], _ v: [Int]) -> Int {
    let count: Int = v.count / 2
    var v: [Int] = v

    var arrayForXmin: [Int] = []
    var arrayForXmax: [Int] = []
    var arrayForYmin: [Int] = []
    var arrayForYmax: [Int] = []
    for i in x.indices {
        arrayForXmin.append(x[i]-r[i])
        arrayForXmax.append(x[i]+r[i])
        arrayForYmin.append(y[i]-r[i])
        arrayForYmax.append(y[i]+r[i])
    }

    let left = arrayForXmin.min()!
    let right = arrayForXmax.max()!
    let top = arrayForYmax.max()!
    let down = arrayForYmin.min()!

    func distance(_ x1: Int,_ y1: Int,_ x2: Int,_ y2: Int) -> Double {
        let x = abs(x1-x2)
        let y = abs(y1-y2)
        let distance = sqrt(Double(x*x) + Double(y*y))
        return distance
    }

    func checkInOrOut(_ x1: Int, _ y1: Int) -> Bool {
        //돌아다니면서 하나라도 원 안에 있으면 true를 반환할 수 있어야 한다
        for i in x.indices {
            let x = x[i]
            let y = y[i]
            if distance(x, y, x1, y1) <= Double(r[i]) {
                return true
            } else {
                continue
            }
        }
        return false
    }

    var result = 0

    while !v.isEmpty {
        let random1 = v.removeFirst()
        let random2 = v.removeFirst()
        let transedCoordi = transCoordinate(left, right, top, down, random1, random2)
        if checkInOrOut(transedCoordi.0, transedCoordi.1) == true {
            result += 1
        }
    }

    let size = (Double(result) / Double(count)) * Double(right - left) * Double(top - down)

    return Int(size)
}
