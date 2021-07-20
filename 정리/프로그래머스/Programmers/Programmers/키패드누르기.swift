//
//  키패드누르기.swift
//  Programmers
//
//  Created by 이영우 on 2021/07/20.
//

import Foundation

extension Programmers {
    func 키패드누르기(_ numbers:[Int], _ hand:String) -> String {
        var result: String = ""
        var currentLeft = (0, 3)
        var currentRight = (2, 3)
        
        for number in numbers {
            switch number {
            case 1:
                currentLeft = (0,0)
                result.append("L")
            case 4:
                currentLeft = (0,1)
                result.append("L")
            case 7:
                currentLeft = (0,2)
                result.append("L")
            case 3:
                currentRight = (2,0)
                result.append("R")
            case 6:
                currentRight = (2,1)
                result.append("R")
            case 9:
                currentRight = (2,2)
                result.append("R")
            case 2:
                let target = (1,0)
                result.append(checkHand(left: currentLeft, right: currentRight, target: target))
            case 5:
                let target = (1,1)
                result.append(checkHand(left: currentLeft, right: currentRight, target: target))
            case 8:
                let target = (1,2)
                result.append(checkHand(left: currentLeft, right: currentRight, target: target))
            case 0:
                let target = (1,3)
                result.append(checkHand(left: currentLeft, right: currentRight, target: target))
            default:
                break
            }
        }
        
        func checkHand(left: (Int, Int), right: (Int, Int), target: (Int, Int)) -> String {
            let XLeftDiffTarget = abs(target.0 - left.0)
            let YLeftDiffTarget = abs(target.1 - left.1)
            let leftDiffTarget = XLeftDiffTarget + YLeftDiffTarget
            
            let XRightDiffTarget = abs(target.0 - right.0)
            let YRightDiffTarget = abs(target.1 - right.1)
            let rightDiffTarget = XRightDiffTarget + YRightDiffTarget
            
            if leftDiffTarget > rightDiffTarget {
                //오른쪽이 더 가깝다
                currentRight = target
                return "R"
            } else if leftDiffTarget < rightDiffTarget {
                //왼쪽이 더 가깝다
                currentLeft = target
                return "L"
            } else {
                //두개가 같을때?
                if hand == "right" {
                    currentRight = target
                    return "R"
                } else {
                    currentLeft = target
                    return "L"
                }
            }
        }
        return result
    }
}
