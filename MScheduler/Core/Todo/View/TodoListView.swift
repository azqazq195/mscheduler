//
//  TodoListView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                TodoEmptyView()
                    .transition(.opacity)
                    .animation(.easeIn, value: true)
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        TodoItemView(item: item)
                            .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.completeItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("Todo List")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink {
                    TodoAddView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TodoListView()
            }
                .environment(\.locale, .init(identifier: "ko"))

            NavigationView {
                TodoListView()
            }
                .environment(\.locale, .init(identifier: "en"))
        }
            .environmentObject(ListViewModel())
    }
}
