//
//  ReminderListItemView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/03.
//

import SwiftUI

struct ReminderListItemView: View {
    @Binding var reminderGroup: ReminderGroup
    @Binding var reminder: Reminder
    
    var body: some View {
        HStack(alignment: .top) {
            Button {} label: {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(reminderGroup.theme.mainColor)
            }
            
            VStack(alignment: .leading) {
                Text(reminder.title)
                    .font(.body)
                if(!reminder.notes.isEmpty) {
                    Text(reminder.notes)
                        .font(.caption)
                        .foregroundColor(Color(UIColor.systemGray))
                    
                }
            }
        }
    }
}

struct ReminderListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderListItemView(
            reminderGroup: .constant(ReminderGroup.sampleData[0]),
            reminder: .constant(ReminderGroup.sampleData[0].reminders[0])
        )
        .previewLayout(.sizeThatFits)
    }
}
