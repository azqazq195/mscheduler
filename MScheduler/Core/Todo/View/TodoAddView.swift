//
//  AddView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/25.
//

import SwiftUI

struct TodoAddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel

    @State var title: String = ""
    @State var description: String = ""

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Todo")) {
                TextField("Todo Name", text: $title)
                TextField("Description", text: $description)
            }

            //                Section(header: Text("Due Date")) {
            //                    Toggle("Schedule Time", isOn: $scheduleTime)
            //                    DatePicker("Due Date", selection: $dueDate, displayedComponents: displayComps())
            //                }
            //
            Section() {
                Button(action: save, label: {
                    Text("Save")
                })
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }

    func save() {
        if !isSavable() {
            return
        }
        let item = TodoModel(title: title)
        listViewModel.addItem(item: item)
        presentationMode.wrappedValue.dismiss()
    }

    func isSavable() -> Bool {
        if isTitleUnderLength(length: 3) {
            alertTitle = "Your new todo item must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }

    func isTitleUnderLength(length: Int) -> Bool {
        return title.count < length ? true : false
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#if DEBUG
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                TodoAddView()
                    .environment(\.locale, .init(identifier: "ko"))
                TodoAddView()
                    .environment(\.locale, .init(identifier: "en"))
            }
                .environmentObject(ListViewModel())
        }
    }
#endif
