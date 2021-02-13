//
//  JSONParser.swift
//  DailyPlanner
//
//  Created by Admin on 07.01.2021.
//  Copyright © 2021 Admin. All rights reserved.
//
/*
 {  “id”:1
    “date_start”:”147600000”,
    “date_finish”:”147610000”,
    “name”:”My task”,
    “description”:”Описание моего дела”
 
 }
 */

import Foundation

 class Task {
    let id: Int
    let dateStart: Date
    let dateFinish: Date
    let name: String
    let description: String
    
    init(dict: [String:Any]){
        id = dict["id"] as? Int ?? 0
        dateStart = dict["dateStart"] as! Date
        dateFinish = dict["dateFinish"] as! Date
        name = dict["name"] as? String ?? ""
        description = dict["description"] as? String ?? ""
    }
}

class TasksProvider {
    func parseTasks() -> [Task] {
    guard let data = try? Data(contentsOf:URL(fileURLWithPath: Bundle.main.path(forResource: "Tasks", ofType: "json") ?? "")) else {
            return []
        }
        if let all = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
            var returnArray: [Task] = []
            for task in all {
                returnArray.append(Task(dict: task))
            }
            return returnArray
        }

        return []
    }
}
