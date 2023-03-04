//
//  TodoModel.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import Foundation

struct TodoModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func update(title: String) -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: false)
    }

    func updateCompletion() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
