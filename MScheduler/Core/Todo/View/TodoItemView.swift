//
//  TodoItemView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

struct TodoItemView: View {
    let item: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItemView(item: TodoModel(title: "첫번째 타이틀", isCompleted: false))
            TodoItemView(item: TodoModel(title: "두번째 타이틀", isCompleted: true))
        }
        .previewLayout(.sizeThatFits)
    }
}
