//
//  ReminderEditView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/03.
//

import SwiftUI

struct ReminderDetailEditView: View {
    @Binding var data: Reminder.Data
    @State var dateToggle: Bool
    @State var timeToggle: Bool
    @State var openDatePicker: Bool = false
    @State var openTimePicker: Bool = false
    
    init(data: Binding<Reminder.Data>) {
        _data = data
        _dateToggle = State(initialValue: data.isCheckDate.wrappedValue)
        _timeToggle = State(initialValue: data.isCheckTime.wrappedValue)
//        _openDatePicker = State(initialValue: false)
//        _openTimePicker = State(initialValue: false)
    }
    
    //    var data: Binding<Reminder.Data>
    //    var datePickerToggle: State<Bool>
    //    var timePickerToggle: State<Bool>
    //    var openDatePicker: State<Bool>
    //    var openTimePicker: State<Bool>
    //
    //    init(data: Binding<Reminder.Data>) {
    //        self.data = data
    //        self.datePickerToggle = State(initialValue: self.data.isCheckDate.wrappedValue)
    //        self.timePickerToggle = State(initialValue: self.data.isCheckTime.wrappedValue)
    //        self.openDatePicker = State(initialValue: false)
    //        self.openTimePicker = State(initialValue: false)
    //    }
    
    var body: some View {
        Form {
            Section {
                TextField("제목", text: $data.title)
                TextField("메모", text: $data.notes)
            }
            
            Section {
                HStack {
                    RoundedRectangleIcon(systemName: "calendar", background: .red)
                    Toggle(isOn: $dateToggle) {
                        Text("날짜")
                        if (data.isCheckDate) {
                            Button{}label: {Text("오늘")}
                                .font(.caption)
                        }
                    }
                    .padding(0)
                    .toggleStyle(.switch)
                    .onChange(of: data.isCheckDate) { value in
                        if (value && dateToggle) {
                            openDatePicker = true
                        }
                        
                        if (!value) {
                            data.isCheckTime = false
                            openTimePicker = false
                        }
                        
                        dateToggle = value
                    }
                }
                .onTapGesture {
                    
                }
                if (openDatePicker) {
                    DatePicker("", selection: $data.date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        
                        
                }
                
                HStack {
                    RoundedRectangleIcon(systemName: "clock.fill", background: .blue)
                    Toggle(isOn: $timeToggle) {
                        Text("시간")
                        if (data.isCheckTime) {
                            Button{}label: {Text("오늘")}
                                .font(.caption)
                        }
                    }
                    .toggleStyle(.switch)
                    .onChange(of: data.isCheckTime) { value in
                        if (value && timeToggle) {
                            openTimePicker = value
                        }
                        
                        if (value && !data.isCheckDate) {
                            data.isCheckDate = true
                            openDatePicker = false
                        }
                    }
                }
                if (openTimePicker) {
                    DatePicker("", selection: $data.date, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                }
            }
        }
    }
}

struct ReminderDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderDetailEditView(data: .constant(Reminder.sampleData[0].data))
            .environment(\.locale, .init(identifier: "ko"))
    }
}
