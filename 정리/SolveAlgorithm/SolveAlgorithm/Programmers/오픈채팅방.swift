//
//  오픈채팅방.swift
//  Programmers
//
//  Created by 이영우 on 2021/08/17.
//

import Foundation

class Record {
    var id: String
    var name: String
    var behavior: String
    
    init(id: String, name: String, behavior: String) {
        self.id = id
        self.name = name
        self.behavior = behavior
    }
}

func 오픈채팅방(_ record: [String]) -> [String] {
    var array: [Record] = []
    for rec in record {
        let strings = rec.split(separator: " ").map { String($0) }
        let behavior = strings[0]
        let id = strings[1]
        let name = strings[2]
        if behavior == "Change" {
            for element in array {
                if element.id == id {
                    element.name = name
                }
            }
        } else {
            array.append(Record(id: id, name: name, behavior: behavior))
        }
    }
    
    var results: [String] = []
    for element in array {
        let behavior = element.behavior == "Enter" ? "들어왔습니다." : "나갔습니다."
        results.append("\(element.name)님이 \(behavior)")
    }
    return results
}
