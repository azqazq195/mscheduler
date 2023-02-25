//
//  TodoEditView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

struct TodoEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var selectedTodo: Todo?
    @State var name: String
    @State var description: String
    @State var dueDate: Date
    @State var scheduleTime: Bool

    init(passedTodo: Todo?, initialDate: Date) {
        if let todo = passedTodo {
            _name = State(initialValue: todo.name ?? "")
            _description = State(initialValue: todo.description ?? "")
            _dueDate = State(initialValue: todo.dueDate ?? initialDate)
            _scheduleTime = State(initialValue: todo.scheduleTime)
        } else {
            _name = State(initialValue: "")
            _description = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _scheduleTime = State(initialValue: false)
        }
    }

    var body: some View {
        Form {
            Section(header: Text("Todo")) {
                TextField("Todo Name", text: $name)
                TextField("Description", text: $description)
            }
            
            Section(header: Text("Due Date")) {
                Toggle("Schedule Time", isOn: $scheduleTime)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: displayComps())
            }
            
            Section() {
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }

    }
    
    func displayComps() -> DatePickerComponents {
        return scheduleTime ? [.hourAndMinute, .date] : [.date]
    }
    
    func saveAction() {
        withAnimation {
            if selectedTodo == nil {
                selectedTodo = Todo(context: viewContext)
            }
            selectedTodo?.createdDate = Date()
            selectedTodo?.name = name
            selectedTodo?.dueDate = dueDate
            selectedTodo?.scheduleTime = scheduleTime
            
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TodoEditView_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditView(passedTodo: Todo(), initialDate: Date())
    }
}
