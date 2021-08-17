//
//  오픈채팅방.swift
//  Programmers
//
//  Created by 이영우 on 2021/08/17.
//

import Foundation

class Record {
    var id: String
    var behavior: String
    
    init(id: String, behavior: String) {
        self.id = id
        self.behavior = behavior
    }
}

func openChat(_ record: [String]) -> [String] {
    var array: [Record] = []
    var idNameDictionary: [String: String] = [:]
    for rec in record {
        let strings = rec.split(separator: " ").map { String($0) }
        let behavior = strings.first!

        if behavior == "Enter" {
            let id = strings[1]
            let name = strings[2]
            
            idNameDictionary[id] = name //Name을 id에 맞게 변경하거나 새롭게 생성
            array.append(Record(id: id, behavior: behavior))
        } else if behavior == "Leave" {
            let id = strings[1]
            array.append(Record(id: id, behavior: behavior))
        } else {
            let id = strings[1]
            let name = strings[2]
            
            idNameDictionary[id] = name
        }
    }
    
    var results: [String] = []
    for element in array {
        let behavior = element.behavior == "Enter" ? "들어왔습니다." : "나갔습니다."
        results.append("\(idNameDictionary[element.id]!)님이 \(behavior)")
    }
    return results
}
