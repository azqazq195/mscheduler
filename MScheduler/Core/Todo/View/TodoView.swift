//
//  TodoView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI
import CoreData

struct TodoView: View {
    @StateObject var listViewModel = ListViewModel()
    var body: some View {
        NavigationStack {
            TodoListView()
        }
        .environmentObject(listViewModel)
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
