//
//  ReminderModel.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/02.
//

import Foundation

struct Reminder: Identifiable, Codable {
    let id: UUID
    var title: String
    var notes: String
    var date: Date
    var isCheckDate: Bool
    var isCheckTime: Bool
    var isComplete: Bool
    var group: ReminderGroup
    
    init(id: UUID = UUID(), data: Reminder.Data) {
        self.id = id
        self.title = data.title
        self.notes = data.notes
        self.date = data.date
        self.isCheckDate = data.isCheckDate
        self.isCheckTime = data.isCheckTime
        self.isComplete = data.isCompleted
        self.group = data.group
    }
}

extension Reminder {
    struct Data {
        var title: String = ""
        var notes: String = ""
        var date: Date = Date()
        var isCheckDate: Bool = false
        var isCheckTime: Bool = false
        var isCompleted: Bool = false
        var group: ReminderGroup
        
        init() {
            self.group = ReminderGroup.sampleData[0]
        }
        
        init(group: ReminderGroup) {
            self.group = group
        }
        
        init(title: String, notes: String, date: Date, isCheckDate: Bool, isCheckTime: Bool, isCompleted: Bool, group: ReminderGroup) {
            self.title = title
            self.notes = notes
            self.isCheckDate = isCheckDate
            self.isCheckTime = isCheckTime
            self.isCompleted = isCompleted
            self.group = group
        }
    }
    
    var data: Data {
        Data(
            title: title,
            notes: notes,
            date: date,
            isCheckDate: isCheckDate,
            isCheckTime: isCheckTime,
            isCompleted: isComplete,
            group: group
        )
    }
    
    mutating func update(from data: Data) {
        title = data.title
        notes = data.notes
        date = data.date
        isCheckDate = data.isCheckDate
        isCheckTime = data.isCheckTime
        isComplete = data.isCompleted
        group = data.group
    }
}


extension [Reminder] {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = ReminderGroup.reminders
}
#endif

