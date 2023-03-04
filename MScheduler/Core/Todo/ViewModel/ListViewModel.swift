//
//  ListViewModel.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [TodoModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            TodoModel(title: "첫번째 타이틀", isCompleted: false),
//            TodoModel(title: "두번째 타이틀", isCompleted: true),
//            TodoModel(title: "세번째", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(item: TodoModel) {
        items.append(item)
    }
    
    func completeItem(item: TodoModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
//    func updateItem(item: TodoModel) {
//        if let index = items.firstIndex(where: {$0.id == item.id}) {
//            items[index] = item.update(title)
//        }
//    }
}
