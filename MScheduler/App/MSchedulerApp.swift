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
            
            let context = persistenceController.container.viewContext
            let dataHolder = DateHolder(context)
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dataHolder)
        }
    }
}
