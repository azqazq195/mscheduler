//
//  ReminderView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import SwiftUI

struct ReminderView: View {
    @Binding var reminders: [Reminder]
    @Binding var reminderGroups: [ReminderGroup]
    
    @State private var editMode: EditMode = .inactive
    @State private var isPresentingEditGroupList = false
    @State private var isPresentingNewReminderView = false
    @State private var newReminderData: Reminder.Data?
    @State private var searchText = ""
    
    var body: some View {
        List {
            // MARK: Status 별로 나누기
            if searchText.isEmpty {
                ReminderContentView(reminderGroups: $reminderGroups)
            }
            else {
                ReminderSearchView()
            }
        }
        .listStyle(.insetGrouped)
        .searchable(text: $searchText)
        .toolbar {
            ToolbarItemGroup(placement: .confirmationAction) {
                if (isPresentingEditGroupList) {
                    Button {
                        editMode.toggle()
                        isPresentingEditGroupList = false
                    } label: {
                        Text("Done")
                    }
                } else {
                    Menu {
                        Button {
                            editMode.toggle()
                            isPresentingEditGroupList = true
                        } label: {
                            Label("Edit Lists", systemImage: "pencil")
                        }
                        Button {
                            
                        } label: {
                            Label("Templates", systemImage: "square.on.square")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                if (isPresentingEditGroupList) {
                    Spacer()
                    Button{} label: {
                        Text("Add List")
                    }
                } else {
                    Button {
                        newReminderData = Reminder.Data(group: reminderGroups[0])
                        isPresentingNewReminderView = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("New Reminder")
                        }
                    }.disabled(reminderGroups.isEmpty)
                }
                
                //                TODO 목록이 없다면 disabledd
                //                .disabled(true)
            }
        }
        .sheet(isPresented: $isPresentingNewReminderView) {
            NavigationView {
                if let reminderData = Binding($newReminderData) {
                    ReminderDetailEditView(data: reminderData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cacnel") {
                                    isPresentingNewReminderView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    //                                     let newScrum = DailyScrum(data: newScrumData)
                                    //                                     scrums.append(newScrum)
                                    isPresentingNewReminderView = false
                                    //                                     newScrumData = DailyScrum.Data()
                                }
                            }
                        }
                } else {
                    Text("error")
                }
            }
        }
        .background(Color("BackgroundScheme"))
        .searchable(text: $searchText)
        .environment(\.editMode, $editMode)
    }
    
    private func delete(at offsets: IndexSet) {
        reminderGroups.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        reminderGroups.move(fromOffsets: source, toOffset: destination)
    }
    
    
    struct ReminderContentView: View {
        @Binding var reminderGroups: [ReminderGroup]
        
        var body: some View {
            if reminderGroups.isEmpty {
                Group {}
            } else {
                Section(header: Text("My Lists")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor.label))
                ) {
                    ForEach($reminderGroups) { reminderGroup in
                        NavigationLink(destination: ReminderListView(reminderGroup: reminderGroup)) {
                            ReminderGroupItemView(reminderGroup: reminderGroup)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: onMove)
                }.textCase(.none)
            }
        }
        
        private func delete(at offsets: IndexSet) {
            reminderGroups.remove(atOffsets: offsets)
        }
        
        private func onMove(source: IndexSet, destination: Int) {
            reminderGroups.move(fromOffsets: source, toOffset: destination)
        }
    }
    
    struct ReminderSearchView: View {
        var body: some View {
            Text("Search View")
        }
    }
}

extension EditMode {
    mutating func toggle() {
        self = self == .active ? .inactive : .active
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReminderView(reminders: .constant(Reminder.sampleData), reminderGroups: .constant(ReminderGroup.sampleData))
//            ReminderView(reminders: .constant([]), reminderGroups: .constant([]))
        }
        .environment(\.locale, .init(identifier: "ko"))
    }
}
