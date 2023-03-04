//
//  ReminderGroup.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/02.
//

import SwiftUI
import Foundation

struct ReminderGroup: Identifiable, Codable {
    let id: UUID
    var name: String
    var iconName: String
    var theme: Theme
    var reminders: [Reminder]
    
    init(id: UUID = UUID(), data: ReminderGroup.Data) {
        self.id = id
        self.name = data.name
        self.iconName = data.iconName
        self.theme = data.theme
        self.reminders = data.reminders
    }
}

extension ReminderGroup {
    struct Data {
        var name: String = ""
        var iconName: String = ""
        var theme: Theme = .seafoam
        var reminders: [Reminder] = []
    }
    
    var data: Data {
        Data(name: name, iconName: iconName, theme: theme, reminders: reminders)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        iconName = data.iconName
        theme = data.theme
        reminders = data.reminders
    }
    
    enum Theme: String, CaseIterable, Identifiable, Codable {
        case bubblegum
        case buttercup
        case indigo
        case lavender
        case magenta
        case navy
        case orange
        case oxblood
        case periwinkle
        case poppy
        case purple
        case seafoam
        case sky
        case tan
        case teal
        case yellow
        
        var accentColor: Color {
            switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
            }
        }
        var mainColor: Color {
            Color(rawValue)
        }
        var name: String {
            rawValue.capitalized
        }
        var id: String {
            name
        }
    }
}


#if DEBUG
extension ReminderGroup {
    static var reminderGroups = [
        ReminderGroup(data: ReminderGroup.Data(name: "할일", iconName: "person.2.circle.fill", theme: Theme.yellow, reminders: [])),
        ReminderGroup(data: ReminderGroup.Data(name: "매일 할일", iconName: "circle.hexagongrid.circle.fill", theme: Theme.bubblegum, reminders: []))
    ]
    static var reminders = [
        Reminder(data: Reminder.Data(
            title: "Submit reimbursement report",
            notes: "Don't forget about taxi receipts",
            date: Date().addingTimeInterval(800.0),
            isCheckDate: true,
            isCheckTime: false,
            isCompleted: false,
            group: reminderGroups[0]
        )
        ),
        Reminder(data:
                    Reminder.Data(
                        title: "Code review",
                        notes: "Check tech specs in shared folder\nAdd notes to retrospective",
                        date: Date().addingTimeInterval(14000.0),
                        isCheckDate: true,
                        isCheckTime: false,
                        isCompleted: true,
                        group: reminderGroups[0]
                    )
                ),
        
        Reminder(data:
                    Reminder.Data(
                        title: "Pick up new contacts",
                        notes: "",
                        date: Date().addingTimeInterval(24000.0),
                        isCheckDate: true,
                        isCheckTime: false,
                        isCompleted: true,
                        group: reminderGroups[0]
                    )
                ),
        Reminder(data:
                    Reminder.Data(
                        title: "Add notes to retrospective",
                        notes: "",
                        date: Date().addingTimeInterval(3200.0),
                        isCheckDate: true,
                        isCheckTime: false,
                        isCompleted: false,
                        group: reminderGroups[0]
                    )
                ),
        Reminder(data:
                    Reminder.Data(
                        title: "Interview new project manager candidate",
                        notes: "Review portfolio",
                        date: Date().addingTimeInterval(60000.0),
                        isCheckDate: true,
                        isCheckTime: false,
                        isCompleted: false,
                        group: reminderGroups[1]
                    )
                ),
        Reminder(data:
                    Reminder.Data(
                        title: "Mock up onboarding experience",
                        notes: "Think different",
                        date: Date().addingTimeInterval(800.0),
                        isCheckDate: true,
                        isCheckTime: false,
                        isCompleted: false,
                        group: reminderGroups[1]
                    )
                )
    ]
    
    static var sampleData = [
        ReminderGroup(data: ReminderGroup.Data(name: "할일", iconName: "person.2.circle.fill", theme: Theme.yellow, reminders: [
            reminders[0],
            reminders[1],
            reminders[2],
            reminders[3]
        ])),
        ReminderGroup(data: ReminderGroup.Data(name: "매일 할일", iconName: "circle.hexagongrid.circle.fill", theme: Theme.bubblegum, reminders: [
            reminders[4],
            reminders[5]
        ]))
    ]
}
#endif
