//
//  Reminder.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import Foundation

public struct Reminder: Codable, Identifiable {
    public var id = NSUUID().uuidString
    let name: String
}
