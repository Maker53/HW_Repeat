//
//  Task.swift
//  HW_2.14
//
//  Created by Станислав on 24.01.2022.
//

import Foundation

class TaskList {
    var name = ""
    let date = Date()
    var tasks = [Task]()
}

class Task {
    var name = ""
    var note = ""
    let date = Date()
    var isComplete = false
}
