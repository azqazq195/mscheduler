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
    private let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.doesRelativeDateFormatting = true
        return formatter
    }
    private let timeFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    
    init(data: Binding<Reminder.Data>) {
        _data = data
        _dateToggle = State(initialValue: data.isCheckDate.wrappedValue)
        _timeToggle = State(initialValue: data.isCheckTime.wrappedValue)
    }
    
    var body: some View {
        Form {
            Section {
                TextField("제목", text: $data.title)
                TextField("메모", text: $data.notes)
            }
            
            Section {
                HStack {
                    RoundedRectangleIcon(systemName: "calendar", background: .red)
                    Toggle(isOn: $data.isCheckDate) {
                        Text("날짜")
                        if (data.isCheckDate) {
                            Button{}label: {
                                
                                Text(dateFormatter().string(from: data.date))
                                
                            }
                            .font(.caption)
                        }
                    }
                    .padding(0)
                    .toggleStyle(.switch)
                    .onTapGesture {
                        data.isCheckDate.toggle()
                        if (data.isCheckDate) {
                            openDatePicker = true
                        } else {
                            openDatePicker = false
                            if (data.isCheckTime) {
                                data.isCheckTime = false
                                openTimePicker = false
                            }
                        }
                    }
                }
                
                if (openDatePicker) {
                    DatePicker("", selection: $data.date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                }
                
                HStack {
                    RoundedRectangleIcon(systemName: "clock.fill", background: .blue)
                    Toggle(isOn: $data.isCheckTime) {
                        Text("시간")
                        if (data.isCheckTime) {
                            Button{}label: { Text(timeFormatter().string(from: data.date)) }
                                .font(.caption)
                        }
                    }
                    .toggleStyle(.switch)
                    .onTapGesture {
                        data.isCheckTime.toggle()
                        if (data.isCheckTime) {
                            openTimePicker = true
                            if (!data.isCheckDate) {
                                data.isCheckDate = true
                            }
                        } else {
                            openTimePicker = false
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
