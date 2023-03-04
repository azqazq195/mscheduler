//
//  MSchedulerApp.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

@main
struct MSchedulerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ReminderView(reminders: .constant(Reminder.sampleData), reminderGroups:
                        .constant(ReminderGroup.sampleData)
                )
            }
            
//            NavigationView {
//                ExampleView()
//            }
            
            
            
//            HomeView()
            
            
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
