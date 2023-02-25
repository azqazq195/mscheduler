//
//  ReminderGroup.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import Foundation
import SwiftUI

public struct ReminderGroup: Identifiable {
    public var id = NSUUID().uuidString
    let name: String
    let color: Color
    let iconName: String
    let reminders: [Reminder]
}
