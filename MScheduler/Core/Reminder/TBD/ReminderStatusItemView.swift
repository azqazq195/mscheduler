//
//  ReminderCardView.swift
//  MScheduler
//
//  Created by 문성하 on 2023/02/23.
//

import SwiftUI

struct ReminderStatusItemView: View {
    let reminderGroup: ReminderGroup
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Image(systemName: reminderGroup.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(reminderGroup.theme.mainColor)
                Spacer()
                Text(reminderGroup.name)
                    .font(.headline)
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            Text("3")
//            Text("\(reminderGroup.reminders.count)")
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

struct ReminderStatusItemView_Previews: PreviewProvider {
    static var previews: some View {        
        let colums = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        LazyVGrid(columns: colums, spacing: 20) {
            ReminderStatusItemView(
                reminderGroup: ReminderGroup.sampleData[0]
            )
            .preferredColorScheme(.dark)
            ReminderStatusItemView(
                reminderGroup: ReminderGroup.sampleData[1]
            )
            .preferredColorScheme(.dark)
        }

    }
}
