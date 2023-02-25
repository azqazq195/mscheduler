//
//  ReminderCardView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import SwiftUI

struct ReminderGroupItemView: View {
    let reminderGroup: ReminderGroup
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(systemName: reminderGroup.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(reminderGroup.color)
                Spacer()
                Text(reminderGroup.name)
                    .font(.headline)
                    .foregroundColor(Color(UIColor.systemGray))
            }
            Spacer()
            Text("\(reminderGroup.reminders.count)")
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.bold)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .frame(height: 80)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("CardScheme"))
        )
    }
}

struct ReminderCardView_Previews: PreviewProvider {
    static var previews: some View {
        let colums = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        LazyVGrid(columns: colums, spacing: 20) {
            ReminderGroupItemView(
                reminderGroup: ReminderGroup(name: "오늘", color: Color.blue, iconName: "person.circle.fill", reminders: [
                    Reminder(name: "할일-1"),
                    Reminder(name: "할일-2")
                ])
            )
                .preferredColorScheme(.dark)
            ReminderGroupItemView(
                reminderGroup: ReminderGroup(name: "예정", color: Color.red, iconName: "calendar.circle.fill", reminders: [
                    Reminder(name: "할일-1"),
                    Reminder(name: "할일-2")
                ])
            )
                .preferredColorScheme(.dark)
        }

    }
}
