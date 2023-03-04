//
//  ReminderGroupItemView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/03/02.
//

import SwiftUI

struct ReminderGroupItemView: View {
    @Binding var reminderGroup: ReminderGroup
    
    var body: some View {
        HStack {
            Image(systemName: reminderGroup.iconName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(reminderGroup.theme.mainColor)
            Text(reminderGroup.name)
                .font(.subheadline)
            Spacer()
            Text("\(reminderGroup.reminders.count)")
        }
    }
}

struct ReminderGroupItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderGroupItemView(reminderGroup: .constant(ReminderGroup.sampleData[0]))
            .previewLayout(.sizeThatFits)
    }
}
