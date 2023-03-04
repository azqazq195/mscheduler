//
//  ReminderListView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/03.
//

import SwiftUI

struct ReminderListView: View {
    @Binding var reminderGroup: ReminderGroup
    
    @State private var isPresentingNewReminderView = false
    @State private var isPresentingEditReminderView = false
    @State private var editReminderData: Reminder.Data
    
    init(reminderGroup: Binding<ReminderGroup>) {
        _reminderGroup = reminderGroup
        _editReminderData = State(initialValue: Reminder.Data(group: _reminderGroup.wrappedValue))
    }
    
    var body: some View {
        List {
            ForEach($reminderGroup.reminders) { $reminder in
                Button {
                    isPresentingEditReminderView = true
                    editReminderData = reminder.data
                } label: {
                    ReminderListItemView(reminderGroup: $reminderGroup, reminder: $reminder)
                }
                
            }
            .onDelete(perform: delete)

        }
        .navigationTitle(reminderGroup.name)
        .listStyle(.plain)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    editReminderData = Reminder.Data(group: reminderGroup)
                    isPresentingNewReminderView = true
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("New Reminder")
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentingEditReminderView) {
            NavigationView {
                ReminderDetailEditView(data: $editReminderData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cacnel") {
                                isPresentingEditReminderView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Edit") {
                                //                                let newReminder = Reminder(data: newReminderData)
                                //                                reminderGroup.reminders.append(newReminder)
                                //                                     let newScrum = DailyScrum(data: newScrumData)
                                //                                     scrums.append(newScrum)
                                isPresentingEditReminderView = false
                                //                                     newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
  
        .sheet(isPresented: $isPresentingNewReminderView) {
            NavigationView {
                    ReminderDetailEditView(data: $editReminderData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cacnel") {
                                    isPresentingNewReminderView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newReminder = Reminder(data: editReminderData)
                                    reminderGroup.reminders.append(newReminder)
                                    //                                     let newScrum = DailyScrum(data: newScrumData)
                                    //                                     scrums.append(newScrum)
                                    isPresentingNewReminderView = false
                                    //                                     newScrumData = DailyScrum.Data()
                                }
                            }

                }
                //                Text("수정화면")
                //                    .navigationTitle("수정")
                //                    .toolbar {
                //                        ToolbarItem(placement: .cancellationAction) {
                //                            Button("Cancel") {
                //                                isPresentingEditView = false
                //                            }
                //                        }
                //                        ToolbarItem(placement: .confirmationAction) {
                //                            Button("Done") {
                //                                isPresentingEditView = false
                ////                                scrum.update(from: data)
                //                            }
                //                        }
                //                    }
                
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        reminderGroup.reminders.remove(atOffsets: offsets)
    }
}

struct ReminderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReminderListView(reminderGroup: .constant(ReminderGroup.sampleData[1]))
        }
        .environment(\.locale, .init(identifier: "ko"))
    }
}
